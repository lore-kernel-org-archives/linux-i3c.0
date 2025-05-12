Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1AAC54754
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfeErbvPujeDWy0Qln47AB5SgnueoRh1tFGLjVWDgr4=; b=EWososRBmpMAMw
	soPYYIBRmg+D4D9y6lYrKCKj5k29hmS8P9qlD0wG0zFOX3VXL10sBonCnGRt8W52OmXhszsqFtWb/
	cy1FSkoMI/AY1PgqSmIU3DDh6VGOYIwcOI5Lt9leVKUQfYInl9Mjk+njJo/focX0wRuj8AC/cuxif
	krf3u2T2qz8gA1qCiRR0KX/btsa6V5avPa5KUggsMbTaUWZrRJuJhicJvO9XNEY5px2rQK8vUp741
	eHsf/XeA0Bxfxf6tJSvxC6T2WFEZgr/avMKrkmoegQZUD9PoELhX50jCMigL1EWsP4S3mOIafJUtE
	K5mNN8R+vXviOLjt4FsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVuw-00000000J3h-2jO3;
	Thu, 15 May 2025 10:34:22 +0000
Received: from mail-vi1eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2613::609] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERbM-00000009HlV-1Pi3
	for linux-i3c@lists.infradead.org;
	Mon, 12 May 2025 11:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKs064IruKrXu+Fe99ifu+jpUaQpqrU4p8ZWaczFgwNR4y9c0T9Tph2Gbm+yqUcsZJaEX+WBqeRBxAN5rtdQ4myypPMXrJBqqjx0YF0S5RRF+RnZC9Jw6qYNcbYMTMDMfSgx95SlIaGcaCHKF9PxLkRxfMMoZt1m9yKupyPklpEzoABfe1oMAIXzJbeVxTTFwP5kqhmd1qkvQO0fp4RwushNneBdasHjrnUhU9P0jD1opScjLxzuFmcH1g6HWt+4BNlevdCDOoktA9Pv75wDVg/Dv51f2fNnDo7oUHU9igr22RpizoDUy9J/e7CaM8cr/f+BVGmZQOXvsHeB2N59uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U464PipND+XOMo9DixC3W5dCkpnvQqv3wW5sb7z96/8=;
 b=Cglcs+N2cCBV/KzREc054ZXQCRwc85xcPyRkacLoPxkWX6YCNMWMUeXyzp8SXOSjoxnMUAZnWyDN3wy+C8VOFzTGPHWeP0xxnRGj2LSJIT2CLlQlfWWyItlpTzt5obaCiv1UlDN5pbHgdO2BJA8BQmXXS1ulfwwvsKLenaRqi0MqU25RKMdHmVHOMJDPhfSe1pX4y2dMONcxTiHQ7GQd7V/mohZCWy5WBBxqnB2h4JMEBJmNTgrNmn038WyfUVrLeHbZ2NT6Ux7y82jDMuoU5PWdJX0voNwm+amjPF+nO3e4mthJsi5vHpf6FDrqiGUFFblJT262++AklZ4qYdmp/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U464PipND+XOMo9DixC3W5dCkpnvQqv3wW5sb7z96/8=;
 b=m6ZKdbuVIMjRgF9oug2gbKwc2vK9GOzYOlkfetemInJ5FNqfXSFPXTq4jlVqxX0WoMu8Hc4BmosG74bxH+1BiOIkjzpOGHZs+gnyY3H71zA6ktecVv23AoUA4Y31zy3r0pMVz4iMKQgEhdmE6mhsJejMlp5pTUa+shSdWXwvu2OVuMOgnHePHH0h+r/rFAv+yFzi/HjQd+Dq6bnAb7Zvei8VjHe8xJSM8DbykFFXA6r2hA7hmoqXvUxeSa9b4JcQk022u1u9mZTp6W6Sg+1G0Yc70v8sYFhPaea3m73JeW+/SY/Tyx3ufOEAJEZhTGMnL8NG6E1xSOaB3TghWaRr4Q==
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 by DUZPR04MB9982.eurprd04.prod.outlook.com (2603:10a6:10:4db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Mon, 12 May
 2025 11:45:33 +0000
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::9b3c:ef2d:7475:5df8]) by GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::9b3c:ef2d:7475:5df8%5]) with mapi id 15.20.8699.019; Mon, 12 May 2025
 11:45:33 +0000
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHbv9WxLs+GN/P+tU+g0QBzNTKyabPIP2GAgAahe9A=
Date: Mon, 12 May 2025 11:45:33 +0000
Message-ID: <GVXPR04MB9778335A5DFAB37CC8D011FC9997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <17145d2f-5d07-4939-8381-74e27cde303c@kernel.org>
In-Reply-To: <17145d2f-5d07-4939-8381-74e27cde303c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR04MB9778:EE_|DUZPR04MB9982:EE_
x-ms-office365-filtering-correlation-id: 341f0502-741b-4c7c-b4b1-08dd914a810b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cZPvllU+OM79I3LY3IniOapGu8aDuRy+StuN2YRJt+maWYym/lalbNaeH7Wi?=
 =?us-ascii?Q?jxvDG/WDAsB2tWFaYRZfAzSWM3yo/eQ2zLZpDlI+xi7kw0w4PjN1aHmGGfzA?=
 =?us-ascii?Q?HQnQaqRe18/bW4xh8BXMmlCy0rbvPDE+27JbIPVcgA/1vGOPR1JzccPQQSog?=
 =?us-ascii?Q?RBhsIbZzdSmX4CeI2HKp6LezEJBS0wx+glXCT29y0zABIkOo2zEBMK3eeRuI?=
 =?us-ascii?Q?MSil2zyUDwH7zTSJXKsMXumHRNUn4jUrX+LfflBeDq+JJMN2azSuHcAERF51?=
 =?us-ascii?Q?Rtp6HTXNKTB5O75pPb7OE6l8e/0TzRatqgOobrAmqAVevbJiM8KpyxcTc/sj?=
 =?us-ascii?Q?7/uusWdRkt8MGlLolCnH4SxFbuG/qbG5HRoCDiCLGGoxtwzZuTwI/tpWbEtn?=
 =?us-ascii?Q?vyqeFFFQZEkHJpIigNkZyHrP22y4HuVa8fG2AgtFDHvSczv3wSpR0SeFGGgB?=
 =?us-ascii?Q?vW8QVcjxeMXml4YPYUtp+tpdkT8w9uYg1TNwEK9XykKgJK0y1Hm4fD3UVXj1?=
 =?us-ascii?Q?t52gYmMAcMGfgJwyTjSnF2uC3gkjzkIhdyL97/DZv60pHhnHTbsQxbAso8YI?=
 =?us-ascii?Q?fXPw6TP0SYX5dNSWn0EJ0CtqwyxCc9jybDwhmj+orxoWE0PzXUDXfcbMkkt2?=
 =?us-ascii?Q?fSIB4ttUbMtpwwb5h8oqerKw6l8HMxl6d9e3ijM35TUi9HhFJve2NSdCDOcZ?=
 =?us-ascii?Q?veex7Tlb+E6SkzXPzj8KDOHUuend46++BeD+ME5U77eBE/0MtdBDJhhhM1h6?=
 =?us-ascii?Q?OIn9qbhie/xY9mk4W/eB0v55wf6D34HGcKuigI61/OItXiSvzA+awgj18r14?=
 =?us-ascii?Q?9t3Onc18VK5eVplj7tQX9CsVvWdM4zB3yVRnNrn6WyNejF4sEaS2DSY5tk8R?=
 =?us-ascii?Q?DkpFF0sxSQCXAZi37gHZj3+UXNn+PvYFRIeOjpdEUCyDtMXeh7DrIkJYP/7l?=
 =?us-ascii?Q?/QEzXFGlrwOt382UyfUluuZ0GqiXaA8eVmoX0hqzcmY3WgrWuNIYrbUjbN/v?=
 =?us-ascii?Q?K4fe/NwdfNxIngBX5FacE4jId6eOOPFlPaJsbBLdhQdUcOYd0Ze7ep5i6djO?=
 =?us-ascii?Q?EJwdjkpfsmyCSQ0NoI1162x+uvRyxzPiQUESmrXlqiyaYemPH9julagzWsEB?=
 =?us-ascii?Q?+7m3lptxSTncEKuJH/47ACnpyJ5i3sTDAflrFDbVv5A+zFI1vCfUMaXXfxLg?=
 =?us-ascii?Q?b4LAMHAA0tHiuoIWMZ/WtN96Dkz+bbRAiguoUFZVMdHLjhB4k9pH0B1LVtoZ?=
 =?us-ascii?Q?A7qBjoKuKAbPTgeVtBeBInhAW/D2xAa4IIdRkaUvN1aTn9jUURVgNG2c1ZVv?=
 =?us-ascii?Q?MU8FwnP5GaV/AUm0c33mAqRmqMR4EN02XfgKbm95dEX2V8aMGF+WwVliFvml?=
 =?us-ascii?Q?Ty8FhRUOQJyDK+GDYpaUCgsVdfNbOEtu8f/NPA3uR7HfDHS4betelU2L0itN?=
 =?us-ascii?Q?59P4MkmHP3AXuhDQ+9WPzXkEIuXm+rgeg6e3UTRC+u2pEWfroVxjwN6qHxCo?=
 =?us-ascii?Q?BmRnCEElI2/rz34=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB9778.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pBo+7FC063xb9p05M2ZpBg2PmxIX0imgFHKcvsbbjv5eGFAcq4fovGSiXbtP?=
 =?us-ascii?Q?5Bb0ZAYWtHDx2Tpw7yJAh3APIFs+moTcQZ27DMI2Q6eFmIvofKlSLKNelprW?=
 =?us-ascii?Q?5J+yR10C//agi6lrBxrkNAsPs0mCYKUjZBODlHokdsE553xakFb/pG2VygeK?=
 =?us-ascii?Q?zcxrosMh3UcddKjiP7NZD5I++vnlBBYO6bhHV4pF9vDutToJ2xhWiO0JECeM?=
 =?us-ascii?Q?0vuPrBet7EBpADDnCNKu3NxPI/oyjDXjI470gEX9udQD76Dbubjf9NZ8O7fZ?=
 =?us-ascii?Q?uY2kz5mVJNIlbzWR+v4Kq00pZvYpwKnt/c/TMESHxmvcv/DjFw0Cp3ozsTfY?=
 =?us-ascii?Q?r+Vp19TiwMoia84kE+YL/Rvx1dToVDIffXW6/mOUgTQGw67PEA4JBIHUFKXX?=
 =?us-ascii?Q?wNVmPIyDPKO6f7FbnaKXxYaaJMYNJ3ZObOhDf2mTZDYpzNcKFG89kf6tbmHN?=
 =?us-ascii?Q?B3+tVA+w3oJe5zMAEs2sswJlCuwqdns2B/ZUCteXeHQmu6N+3GelvUr+IKeS?=
 =?us-ascii?Q?kJ+854/JO2F8hR/OQHgl6hhuW2ohAu4XLzILpa5WYEburVc4e14+kzqekoNy?=
 =?us-ascii?Q?wkhgj9jxqAp6ZPVNZBZGU50V4/COQeZnxAnDhMsqmwSg12lOBpSjlTWdsvQL?=
 =?us-ascii?Q?upuUPD9/71wrpMh4x6rPE8e37qeb90hb2ogGZ6Uw63SCGwej8pfAud7piVhL?=
 =?us-ascii?Q?ZBR6raaLCZVKq0qJm5RdVnZzzAXtixxchvVaUvuxMgOn+gnTmccaIdE9e0LT?=
 =?us-ascii?Q?1C2IiBa/3LV+xEmH4nNOyqcZLpDt/cncLjZQHuLAc3nmR5FQTzsJWQj04HfH?=
 =?us-ascii?Q?8+QYoTzLupImRAkcEyqFtqljhgPeJvHmSk5IZPqT+ugk2dt11W3TP7S5VS6r?=
 =?us-ascii?Q?OT/X//9jcP1GHpn8NQHctB/rrBRgTdtmwdc68EA0HiIhuLiqqvXdMPHUQIor?=
 =?us-ascii?Q?FEkWGEZ1pQZJ0oJvADM4TBa83rNy6b2ZlVZd32vGvHzXf6eQjCA04xQq4dEN?=
 =?us-ascii?Q?fodGyIVpupiQBqDLlQVxkECayGsd9PUeWIjjS2lNYmEbjuwjiXhN3LA/M8ea?=
 =?us-ascii?Q?mb6oiUs0BZc/OBAFORBLzv48dodmS63VYwQE37FJTzknTD/hqTpEmp9a61Et?=
 =?us-ascii?Q?AFPtSbOt+n7AVqdMQIwkosbwYzBm/7+UEO503q+fzjuq4U7q7pAgztryzCSX?=
 =?us-ascii?Q?CkF2+pJgZ57aYZB933xXFD5pNbxhgvwP/IUO8ld9NQVnIi79LMIJ0cNKgETf?=
 =?us-ascii?Q?Vgwi/vVnq9XX2FCbssjCTtRf9spLrUzu0+mTxWXm42sWS7aJmGFRn36233MB?=
 =?us-ascii?Q?YfU7VbqdMj5kj0n7/LNZl8BU1eN4V/Vu2d/nNDKovG9vIB1cV2z/uqibolaR?=
 =?us-ascii?Q?rguPHaAJuBR2Zuf82GWKjbwGlz/skrGqnp8sr0HBhvJ7lOPaC/+XB9QO5D1X?=
 =?us-ascii?Q?dUo1+WO2b5Gb1c4Uh3wTXmdJtr/lCnPG7ACEwgkydXWTv/VKE/UeozrCoQml?=
 =?us-ascii?Q?x/Rre4B5Tl79WrLvDAxgmbuIC48n+Ua1XOk2l/JBkUym3mcGlkCScVLcmsf6?=
 =?us-ascii?Q?l3RonBThuSti1oOwU5DiPqJ6m3W0d8pu0qN8QOe0?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB9778.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341f0502-741b-4c7c-b4b1-08dd914a810b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 11:45:33.4776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J33RoT6mcP1qJkhYKI8aglQU7MN5kyt6aKhk5uGL/6Z0ugWtcnuYvhtYcbN6NQkrxcBYnCnS+UaQIyLCIUugKHGDeMYEIvJwOF6bVFb7LLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_044544_375573_0A0050B6 
X-CRM114-Status: GOOD (  23.38  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:28 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, May 8, 2025 11:38 AM
> To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>; linux-
> kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Frank Li <frank.li@nxp.com>
> Subject: [EXT] Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
> support
> 
> Caution: This is an external email. Please take care when clicking links or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
> 
> 
> On 08/05/2025 06:57, Aman Kumar Pandey wrote:
> > Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> > multiport I3C hub family. These devices connect to a host via
> > I3C/I2C/SMBus and allow communication with multiple downstream
> > peripherals.
> >
> > Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> > ---
> > V1 -> V2: Cleaned up coding style and addressed review comments
> > ---
> >  .../bindings/i3c/p3h2840-i3c-hub.yaml         | 332 ++++++++++++++++++
> 
> Not much improved. I have doubts that you really looked at other bindings.
> 
> Filename matching compatible.
> 
> 

Thanks for reviewing the patch.
There is no existing entry like this one. It is the first device tree entry for any i3c target device being added to Linux upstream. 
For I3C target device, compatible is not required as per i3c.yml. I am adding compatible for backward compatibility with i2c binding ( i3c target device have backward compatibility). 
Should I use compatible matching filename in this case ?

> >  MAINTAINERS                                   |   8 +
> >  2 files changed, 340 insertions(+)
 
 
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^hub@[@.*]+,[0-9a-f]+$"
> 
> Drop
> 

Sorry, did not understand your point. Could you please give some clarification ?

> > +

> > +
> > +  cp0-ldo-enable:
> > +    type: boolean
> > +    description:
> > +      Enables the on-die LDO for controller Port 0.
> > +
> > +  cp1-ldo-enable:
> > +    type: boolean
> > +    description:
> > +      Enables the on-die LDO for controller Port 1.
> > +
> > +  tp0145-ldo-enable:
> > +    type: boolean
> > +    description:
> > +      Enables the on-die LDO for target ports 0/1/4/5.
> > +
> > +  tp2367-ldo-enable:
> > +    type: boolean
> > +    description:
> > +      Enables the on-die LDO for target ports 2/3/6/7.
> > +
> 
> NAK for all above properties.
> 

These are not vender specific properties. all these properties are as per i3c hub specification.
 What should I change for above properties ?

> > +  cp0-ldo-microvolt:
> 
> Do you see anywhere device properties named like that? Without prefix?
> 
> I am not going to review the rest. You did not try hard enough to fulfill
> previous review request, you did not really test it.
> 
> Start from scratch from latest accepted schema or from example-schema.
> 


> Best regards,
> Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
