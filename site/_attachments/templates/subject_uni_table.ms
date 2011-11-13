<table>
  <thead>
    <tr>
      <th>University</th>
      <th>Average Entry Tariff</th>
    </tr>

  </thead>
  <tbody>
    {{#row}}
    <tr>
      <td>{{value.institution}}</td>
      <td>{{value.guardian.avg_entry_tariff}}</td>
      <td>
    </tr>
    {{/row}}
  </tbody>
</table>
