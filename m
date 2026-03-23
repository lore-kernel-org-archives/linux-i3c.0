Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650E0D58CC5
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 04:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2abLQc8t2fB3m6xfr+GioT3JfwSkNTZmTEpn0LrhXIU=; b=O59+7ZyUpbC459
	SW6E9TXm03wIg3/rD1ynQ1nR9HAzYFXJhmhkR9WPUMNlVpXhF8vdcs4PeUUXFoT5TxpAJNSZ+8bkm
	W0Pl5ZYR6Mh1teOvTKe4O+MMJmPfYeW/1rkXKqXV+6LWlksZ53i8W17ivtH5Ek1Yz2ZBAmWJHXcpb
	bIhSkNQDec/cODuf0rQJFr5adTjW5MQLSeqcs9IhGtJ3F7aLYP/brItm2kRIvdWLo40VDBM6oykZL
	mflrfFShrPPmQnPLJZenZoF434kJOIzN09l/TXjF4S8sLeVIVmPz6/o8GAPw5XwY8/o7oDsdDKiQL
	QDHTy8cn18+lRe7HDUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X3p-0000000G1iS-0a9u;
	Mon, 23 Mar 2026 04:38:41 +0000
Received: from mail-swedencentralazon11013017.outbound.protection.outlook.com ([52.101.83.17] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X3n-0000000G1hn-0DcM
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 04:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5aEpgkrYpvs1GsM0Q33Qtwr+GMpUJciPJ5LHU0g+ouz0xN2J4J4QmyABYYvzzCCLKemh4OaRZXht8Hi9tWCnEpnPkAlfByKLtdEI/vD9b/sAwQoYUtQRb1bQtL64fMbRReJSnYHfsyzqQVt+D9/WjH3x15AWT/uMCbhZ9/uZDdSxL9RMiGgnG1s4gdF9v8q0HqkK7zXnhyV/1yzWzpfcHqDKQF0LQuSVSS5dsFsXjBjSVdF/wSakrrEcMX3WDgOQNROf8JMm3/MpRtPvpSjbEPRmo6iqzkbaRgB4310ZdYAuQ8jdSJNO25azOLQeNB4DutpjxqTeJ7x0kfc7OHYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u95bkrxA35gCox2QEMFedsh4C7pzbd//E/JMoCGAkgc=;
 b=LL6tUVu016F0y2er1HFsuUWKYQUAx5nDpw5UMNeFyzrhioRHGlReY3MjDOfok7Q8bIeRck6/aBZ1D7QzyKCay5qWGWCul+X2QDJ8saUrSCkCdCUEhA2BTLJJay7h1MJh4fJC7kpJGL8q8jKaeyt7chv6gftSJP9vBHEifcRyJDTd7UhaWgTEyG67wxwGiBvaf5RYO3oeRxTtjHRqYXJvBTGxaRFcRvBo5djkH5o/igHyzZnJc78PHzhdNGXfVRR2OnTjfJnt6oYMToaMGC/QJx3h35if+1LxkIpEmHIO7KSFnUNm8tltICru+h/uG4z5q/6cYHZ9JDUUnZmPoR07Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u95bkrxA35gCox2QEMFedsh4C7pzbd//E/JMoCGAkgc=;
 b=IB9B/UMlj0lP8dYSpYOS5oeuOl4tnjdwZx9oJThjlHpbg2IMvoDGCnsX8KPB59Cf2XXuwyI6Rq62eWTGGdT9pYB46NCUd5WlOQYGIywLjvufaH+VW1mjTOevnxweonrohi3yZKMM3fbHVXkeVzqFLeDuw4yEzWAYqsmbnN68nKTEcshYRTyWpMu7X3nFNKpEnadO8CV0g8pKWFLcr9Ywqqc78rgxUOWlTQh2DBC0vfQJV0ElEZEPa/6gd6177HlWncbf23QJIFIIM51hYrJ2ebF2s4fPoyXlTuANoFWNZc+dczHLA8JQT8KE0yR6/PpVykNsfSyMx5aqEaK+B774lg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Mon, 23 Mar
 2026 04:38:02 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.20.9723.018; Mon, 23 Mar 2026
 04:38:24 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, Vikash Bansal
	<vikash.bansal@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>, Aman Kumar
 Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v7 3/7] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v7 3/7] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHct5MG+aVCpqTALke0cNZq85oSw7W7OeaAgABUEEA=
Date: Mon, 23 Mar 2026 04:38:24 +0000
Message-ID: <AS4PR04MB9362627FC869B478EA002A2CFB4BA@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260319112441.3888957-1-lakshay.piplani@nxp.com>
 <20260319112441.3888957-4-lakshay.piplani@nxp.com>
 <20260322233511.GA72130-robh@kernel.org>
In-Reply-To: <20260322233511.GA72130-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AM9PR04MB8890:EE_
x-ms-office365-filtering-correlation-id: f178e5a7-9b98-4edb-a090-08de8896054d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: NGPLxlg5c1mFB/71nNn7HYw7DzHC2+jFrKiHvEYSsAlAfXjTAHY0O9UqEMvqEjQ7SuVRzl2HvdUPfV0y8MGkganuWEGzRmkerWeNYJ/n31LjxTFwX9nkk15Maskwbz5Sw6EHWd/YDeSscCZyvXnQ+gjuNxao/n7I0ryafRxM2yFiQK6mH/mk7nAiJdn5XrgB4gKNfbnom8a+81THkeoUisCyaE/CJveKSutwLIU9U01G7XtBDdbXjYzKzyKPbH4hcxJ59+++bs7gOj8IWJZ0dV6UjMuSEFqetJ0jR6fhGmLfGCZZbAFLrdSvg5KGQNmyNzmrTH55TVpQi/PVDdHqDyWDMuvlVE3YNVmpxtbgwXA7nHxQ4OKTRYW8lilEo0aJc6Aq7WKhd/fYZxAgaV9ft+OcL/1GObzv7MPxD6ZjMdYXVJqyzsOfM1ZbC3PSZZeXSEWQncnvlr6JSSB2mvpgMKSYI1SOe1f4eqYadX5tu3hNydtAFyxtwY5m1WMLI7JYmrYEOMJwkJWtHRjLL4TEDUtyWtItWuHpUT8I4pVkONfyxPQkvrUe7OW2k4Rw32ZQYaD5gblBpmk/ApBLRsz3R3/w1uANeavVuYNiZmuKL2VaSnWXyx1sdEFl5PCbvE2UEoZ/w/TBUdWPIlHUkxDrzeaVL4q7tOrWQa6p9oLLCGWNxM1PwZEtGl/BBfYPOHa47BrM8WIMVm8D15uWhx4PBJ0x2hmwolQ3zsshoTI0y8201ayYU2l/WCJlbeq6w5/A0cZbMayZTfdgNDaWYFiD3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BBAEUVU0WfNhZNhtPHw7iYiCa5RV3K+t/PzRyagwBapFlgNQVE8ureyfOA0I?=
 =?us-ascii?Q?LuvDs63ZQBuPbYaia+XSNdmk9xEtfDyEs2lv4vrULdgLMqe6qqtTQmzq1m6l?=
 =?us-ascii?Q?GgkeT58EJ1716dyu1IAOFvSyH5ZL/B8bPCl+sltIDLJInsR8yxeYkAwiEShR?=
 =?us-ascii?Q?gCVJr0ZKFUlDCcTjNkGf+rAULh4Y+BuF3WxpKu43Bhl7kIApawovq31lVcZ2?=
 =?us-ascii?Q?GzW5UVUOmbeyyYAfEN/QrK0c8v0OVbj/SqptNmvxqT3AVeIp8YVng0DIcTWg?=
 =?us-ascii?Q?KBcDQ5DInYC5/qSRAAg6aMITjLB0kgYSdEPhY2HtlNrZ3h98OSHnKOkpYMKD?=
 =?us-ascii?Q?MG16ixZOUZbFXKZqXQuZfGZFsZkqqsQEXwBVFwmvn3BDAIpI3qfU0hD+2LWa?=
 =?us-ascii?Q?eGVBvyy31MlCncKMW0syC/9lk2J1AO7PpSaMYrC7HT134yNCsMo1ibBRAw+a?=
 =?us-ascii?Q?0ebUgHWhf51bdGdVcXrEyL9Yu02T9ON3L6/27RY3BYcKP6m9t1kNat6Knv+s?=
 =?us-ascii?Q?3Lb6jd4JW3WhrzjygUUZT7yf5WUoegPM3BvzE5mlIAGpQqJ6bZTFbCNw6r0t?=
 =?us-ascii?Q?MtrIebRNik6cwMXxCF/4Xs6trblCVD5pKd8K1Hmn9X8Dqbb0gwlcqAgZWl2d?=
 =?us-ascii?Q?rqp/cT6qaxSmuknNn08O+sYHiz0afk5MQOVqbdtdEu005DFjE3lliSrvxCG6?=
 =?us-ascii?Q?kpnvd4z/jklHkwMXLSt8iGuYr6SV/gVfyznNoqwSGNs+/eD6yMY6tach6Xdk?=
 =?us-ascii?Q?p7DFKB+a5SKYbNnvFD/zKtNvodP76Y+ElL5cX4dKvHxA/4uRe/mNcWZB6Q97?=
 =?us-ascii?Q?kF0YBntV9RUbErlvcGi9+MQ5regQcRdnXzsw4cl/gyCgwtzJCMynhVO2AUkD?=
 =?us-ascii?Q?SDNtHCKZ7b/6lEx0Zt7rQA9lqL9AULGgEJMI4Wn8a7krY71LDuJXSqPSVFjp?=
 =?us-ascii?Q?Qa3WOY1kdaGJ3tDjs6yOisygaA3J5CUdzr6ZReOlX7m7Thj5lCgEVX0fwS/a?=
 =?us-ascii?Q?1BwbpfZ5v7VMks7cGjvOE682KQ8fBX9G9mq+LAMk6rN7lDwoo+9mcuPkl7cA?=
 =?us-ascii?Q?XWe+l3+tTPxFtfOQukbfTaMwy/Wt5vu6iCotyc9pdBsXxDCq610476D9TFWg?=
 =?us-ascii?Q?cj4uh7v5OweaL5OMx5zqwYtZiP+jbp/1tnLKKxkR59sU5/BniGqGKMvpwRqC?=
 =?us-ascii?Q?pmZLHa8YzoHMrKsrEd6FCqatQk2Y8G+eY6/OJ46V6ceLrOvw4rRMWQm+SalN?=
 =?us-ascii?Q?kbk69mWwk0FEs6moijdgVHTkQDUa1LFsGTtmYg63ikAsxZSwBttvKsuArLhz?=
 =?us-ascii?Q?XAKXwkrR72Dgcbbj5iWDNOISYwK128PC6xIZUxxLGB7IKk/X+4h9sLiesFyb?=
 =?us-ascii?Q?KPGzB8DRZ+h6ooeNYf53po2io8uiqD4fhkL5y91gpd2uqlzMlAJpE2F6/dGY?=
 =?us-ascii?Q?h63HRrPHoCm6IUmGZ9jGFK8pisETsvfpzHH3qO1Vy5QR9rYJr90zxE3Visfg?=
 =?us-ascii?Q?ZEcoIczsj4rgO74yx+V1gVMLZX1Zx2CKOGBL2cywO+0BI9kiQf9FDSsNEpVm?=
 =?us-ascii?Q?MxWZqCgBqpC4hOP+u1+5EuO9eN2xAX4xLlRV5R8n12396nGigU5IwEOaMc16?=
 =?us-ascii?Q?vm93LQzmdQMiZ1TZbZ//SWCENQTVy9ll4wjiNChxPvKg/hLrCybyAni1Y2UA?=
 =?us-ascii?Q?5FH1i2EzohYRYEZR335iKBi8sDV1nR5rI5Xl3b5t+oO9yZDjsE36SNNxOkAJ?=
 =?us-ascii?Q?/NXws9Wasw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f178e5a7-9b98-4edb-a090-08de8896054d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 04:38:24.8538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ty6uXQF6kQW6xQklOhERmOAzG51MTQ3mzdys67kyyApgUoolDRWeNEFRQ1CwQj45PnYyUlDk1Z+pbmzcuoqcmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_213839_271290_19B92BD3 
X-CRM114-Status: GOOD (  26.24  )
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
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, March 23, 2026 5:05 AM
> To: Lakshay Piplani <lakshay.piplani@nxp.com>
> Cc: linux-kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; conor+dt@kernel.org;
> devicetree@vger.kernel.org; broonie@kernel.org; lee@kernel.org; Frank Li
> <frank.li@nxp.com>; lgirdwood@gmail.com; Vikash Bansal
> <vikash.bansal@nxp.com>; Priyanka Jain <priyanka.jain@nxp.com>; Aman
> Kumar Pandey <aman.kumarpandey@nxp.com>
> Subject: [EXT] Re: [PATCH v7 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
> support
> 
> Caution: This is an external email. Please take care when clicking links or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
> 
> 
> On Thu, Mar 19, 2026 at 04:54:37PM +0530, Lakshay Piplani wrote:
> > From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> >
> > Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> > multiport I3C hub family. These devices connect to a host via
> > I3C/I2C/SMBus and allow communication with multiple downstream
> > peripherals.
> >
> > Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> >
> > ---
> > Changes in v7:
> >  - Fix schema validation issues
> >  - Adjust required properties
> >  - Add I2C example
> >
> > Changes in v6:
> >  - Use a vendor prefix for the attributes
> >
> > Changes in v5:
> >  - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
> >    tp0145-ldo-microvolt, tp2367-ldo-microvolt
> >  - Changed supply entries and its descriptions
> >
> > Changes in v4:
> >  - Fixed DT binding check warning
> >  - Removed SW properties: ibi-enable, local-dev, and always-enable
> >
> > Changes in v3:
> >  - Added MFD (Multi-Function Device) support for I3C hub and on-die
> > regulator
> >  - Added Regulator supply node
> >
> > Changes in v2:
> >  - Fixed DT binding check warning
> >  - Revised logic for parsing DTS nodes
> > ---
> > ---
> >  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 303 ++++++++++++++++++
> >  MAINTAINERS                                   |   8 +
> >  2 files changed, 311 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> > b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> > new file mode 100644
> > index 000000000000..495e0e4c1ae1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> > @@ -0,0 +1,303 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
> > +2025 NXP %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> >
> +cetree.org%2Fschemas%2Fi3c%2Fnxp%2Cp3h2840.yaml%23&data=05%7C02
> %7Clak
> >
> +shay.piplani%40nxp.com%7C41cb77ab9e1a4bd9525208de886bab1b%7C686
> ea1d3b
> >
> +c2b4c6fa92cd99c5c301635%7C0%7C0%7C639098193138487662%7CUnknow
> n%7CTWFp
> >
> +bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4
> zMiIsI
> >
> +kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ofJ5OTL%2Fn
> kxuq1Ky
> > +bU5RTJtwo4yMNFHvObf2iTFnaSg%3D&reserved=0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > +cetree.org%2Fmeta-
> schemas%2Fcore.yaml%23&data=05%7C02%7Clakshay.pipla
> >
> +ni%40nxp.com%7C41cb77ab9e1a4bd9525208de886bab1b%7C686ea1d3bc2
> b4c6fa92
> >
> +cd99c5c301635%7C0%7C0%7C639098193138518717%7CUnknown%7CTWFp
> bGZsb3d8ey
> >
> +JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> TWF
> >
> +pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Oy7On%2FMYpy93DRw
> O243lEvJ%2F
> > +oCfusLv0j2e0S93cNnk%3D&reserved=0
> > +
> > +title: NXP P3H2X4X I3C HUB
> > +
> > +maintainers:
> > +  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > +  - Vikash Bansal <vikash.bansal@nxp.com>
> > +
> > +description: |
> > +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport
> > +I3C
> > +  hub devices that connect to:-
> > +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to
> multiple
> > +     peripheral devices on the downstream  side.
> > +  2. Have two Controller Ports which can support either
> > +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> > +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> > +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> > +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect
> to
> > +     peripherals.
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,p3h2840
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  assigned-address:
> > +    maximum: 0x7f
> > +
> > +  nxp,tp0145-pullup-ohms:
> > +    description:
> > +      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
> > +    enum: [250, 500, 1000, 2000]
> > +    default: 500
> > +
> > +  nxp,tp2367-pullup-ohms:
> > +    description:
> > +      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
> > +    enum: [250, 500, 1000, 2000]
> > +    default: 500
> > +
> > +  nxp,cp0-io-strength-ohms:
> > +    description:
> > +      Selects the IO drive strength for controller Port 0, in ohms.
> > +    enum: [20, 30, 40, 50]
> > +    default: 20
> > +
> > +  nxp,cp1-io-strength-ohms:
> > +    description:
> > +      Selects the IO drive strength for controller Port 1, in ohms.
> > +    enum: [20, 30, 40, 50]
> > +    default: 20
> > +
> > +  nxp,tp0145-io-strength-ohms:
> > +    description:
> > +      Selects the IO drive strength for target port 0/1/4/5, in ohms.
> > +    enum: [20, 30, 40, 50]
> > +    default: 20
> > +
> > +  nxp,tp2367-io-strength-ohms:
> > +    description:
> > +      Selects the IO drive strength for target port 2/3/6/7, in ohms.
> > +    enum: [20, 30, 40, 50]
> > +    default: 20
> > +
> > +  vcc1-supply:
> > +    description: Controller port 0 power supply.
> > +
> > +  vcc2-supply:
> > +    description: Controller port 1 power supply.
> > +
> > +  vcc3-supply:
> > +    description: Target port 0/1/4/5 power supply.
> > +
> > +  vcc4-supply:
> > +    description: Target port 2/3/6/7 power supply.
> > +
> > +  regulators:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      ldo-cp0:
> > +        type: object
> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      ldo-cp1:
> > +        type: object
> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      ldo-tpg0:
> > +        type: object
> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +      ldo-tpg1:
> > +        type: object
> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        unevaluatedProperties: false
> > +
> > +required:
> > +  - reg
> > +
> > +patternProperties:
> > +  "^i3c@[0-7]$":
> > +    type: object
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          The I3C HUB Target Port number.
> > +        maximum: 7
> > +
> > +      '#address-cells':
> > +        const: 3
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      nxp,pullup-enable:
> > +        type: boolean
> > +        description:
> > +          Enables the on-die pull-up for Target Port.
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> > +  "^(i2c|smbus)@[0-7]$":
> > +    type: object
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          The I3C HUB Target Port number.
> > +        maximum: 7
> > +
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      nxp,pullup-enable:
> > +        type: boolean
> > +        description:
> > +          Enables the on-die pull-up for Target Port.
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i3c {
> > +        #address-cells = <3>;
> > +        #size-cells = <0>;
> > +
> > +        hub@70,236153000c2 {
> > +            reg = <0x70 0x236 0x3000c2>;
> 
> Once again, you must have a compatible. "The device is discoverable" is not
> an argument. If it is discoverable, then don't put the device in DT in the first
> place.
> 
> Rob

Hi Rob, 

Thanks for pointing it out. 
I've added the missing compatible in i3c example; will include it in v8.

Regards
Lakshay

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
