<h2>Subject Area: {{_id}}</h2>

<table>
  <thead>
    <tr>
      <th></th>
      <th>Number of Students</th>
      <th>Percentage of All Students</th>
      <th>Ranked Subject Area</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Undergraduate</td>
      <td>{{undergraduate.value}}</td>
      <td>{{undergraduate.percentage}}</td>
      <td>{{undergraduate.rank}}</td>
    </tr>
    <tr>
      <td>Postgraduate</td>
      <td>{{postgraduate.value}}</td>
      <td>{{postgraduate.percentage}}</td>
      <td>{{postgraduate.rank}}</td>
    </tr>
    <tr>
      <td>Other Students</td>
      <td>{{other.value}}</td>
      <td>{{other.percentage}}</td>
      <td>{{other.rank}}</td>
    </tr>
  </tbody>
</table>


