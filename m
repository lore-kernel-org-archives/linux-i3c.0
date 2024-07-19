Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1F4C3DA61
	for <linux-i3c@archiver.kernel.org>; Sun, 21 Jul 2024 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bARmEV3ERdJPfeRK3MaJvHoS9p9IOcjF/m6d2UPDpGg=; b=KfkPV7COkONf1T
	eTgPlfWleojS4gPQYylTgijOvQvB6yO3LublUNQkXDHr1QZoctakUgCeKY2d7J0BG+I2leFlElGkg
	V34qRY7SvtCA96ya0tJxsOQSBfL4w7ysh39+vVRq7Clh4Tmtiths5KEinHKp+uZLkXY7h2JHrYh7b
	JtPJJuaw2SWwFdZQ5bIXMlkdCPUh5foENo4nuDPJXo73W6xYdhzaUQPnkNC6kd+ReLoAPQgLQosnB
	KcQkZfe/Z57tDU6y6MuysURrLbIkqFugejET5zWfmcDj9r/QUabiqZV3M10nD7AiUMCMB8Zjs+A4X
	QJxTuxsdgK1vyOnk7O0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVemY-00000007f64-1QVv;
	Sun, 21 Jul 2024 22:11:54 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUcwK-00000001H9p-0DC9
	for linux-i3c@lists.infradead.org;
	Fri, 19 Jul 2024 02:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2pPZx950PdbI2lUl1Zv1d6oYwaczXF51fAbwdVea//HdGP0wdA7aYDcbf/5n/kNG6tmL0xyGHgeb+FjsVOSZ5Rb/odA4WJX+l6ext0I1FC1mjx2WNIXs4StvKMsEC3/RI4B+j7Kjja9I51iOP1Qx0hF76QVoPDJV3REP7w9hRiXQNOxIcoaGl+9L/6FTPC5+6iVA1tBzMulpRXufRTLsTdHTJRNa92KSE6CrazDR7NMmoACdInHI9NJi0ZAguJpLA6Bg9ZtKM3wCeZbtFkm0wV/d1gkmVTXKoYDt6VN2lYjIQuUtKfoHfnGNNhsuZ5nlSdwFlR1SWP1uRBzMQ+slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn7paqQvLxeIQT9vqHEKDnVIoYjWiGHvJjC6Y1vaWFQ=;
 b=pT5xfPBQl8xM2JQdJsZV2vgR78YhP07Lv3T6EepvX6ceE6zqufao/atUNjcgC18XiEVOTrigDjR/aYmfcbYVHkg3SGldFDFY+fKuNy+sk63qaGcNX+EtpoFhmkDZqPo85uCRGGaLjitWrpIRZWTMfdMhgqbJHI6GqvNKNkMHVuswND76XrJKw96gisDU+WfjV4621a782D/nFRoNrIdYhvyOU8YMxPJhh4CXtpFuEcUKwbcVLzvswYV7kWU0+xv1fzPLShYPcLD9Gxs4wOwLnPO4eGMDGgnGmDrvf9fcZaK8SNdiBX0/9BoeZr6Wj1xxQ93hhpd5X7JRm4DioeOh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wn7paqQvLxeIQT9vqHEKDnVIoYjWiGHvJjC6Y1vaWFQ=;
 b=dj3T0YJZx8pwwuJzL1itGHM3xZe2XK7cTmmVIIqQi82yjkztrANXb5pkP3Rnu3sYqwkEoPddG82psj3YwdxGEGUYIlwAJiqrGXNcv/Zr3mzxVUMSzNoryyaQ3AROfjWtzuNHtM+3F8MsgjV4RqNEsi1EW3Se1+ETtP1zTmwKl5g=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by PA1PR04MB10723.eurprd04.prod.outlook.com (2603:10a6:102:491::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 02:01:36 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%7]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 02:01:35 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>
Subject: RE: [PATCH v2] i3c: master: svc: adjust SDR according to i3c spec
Thread-Topic: [PATCH v2] i3c: master: svc: adjust SDR according to i3c spec
Thread-Index: AQHa2PK6+hr1q6rHeUKJbcuFxFpFvrH8g1gAgADHfLA=
Date: Fri, 19 Jul 2024 02:01:35 +0000
Message-ID: <VI1PR04MB5005A8C7EFBFE2D1D5BB2605E8AD2@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20240718091329.3788619-1-carlos.song@nxp.com>
 <ZpkfnGnPkzg1HW9A@lizhi-Precision-Tower-5810>
In-Reply-To: <ZpkfnGnPkzg1HW9A@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|PA1PR04MB10723:EE_
x-ms-office365-filtering-correlation-id: d3f02494-a732-4828-bc5e-08dca796b83e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IAWQ9BCtqBTjo6bWySaoHQ0gUmWgQsNNawAk9uWVytj6g2wBZe9xRQOqlayz?=
 =?us-ascii?Q?Glt/vlprEm75fJ+Hqzh+pCzMLfBntMWKqWymrJNjO3lP4Zw7bS0QmpFBiTVw?=
 =?us-ascii?Q?jAUIMG5poBt0gvR7qneBQ/ebQY0UN2sbRd13qEVBupXTlf4FLOq3ve8GFLDc?=
 =?us-ascii?Q?/XxKgjvMhYSv8RtXUiL+D2Pf6zPCX1IhVxFk+1SERzxCsE5jHEn9N/6TtFqc?=
 =?us-ascii?Q?cmRxmB674mj8xmiJ1Uf4NuFKhme/K0+YP7BzZge6cIC1HcGs7j4yGhLDPvnv?=
 =?us-ascii?Q?3MwSRjdJM6Aq2Rh2pPxPl+Vab2L9C6TDIOePbUXTHhZmFOcEj/01J2kJBPwo?=
 =?us-ascii?Q?ufkytzPhe/2vGRcIxF4QSSUbFym316zlhTWOdcGCLmXAl7KEM4FhylH56+Iy?=
 =?us-ascii?Q?M5RzwMz6lgxQ/gItTVOGarCdGwSoQMdgAARwJduNi5gXVyFyxQCZBF0YYr+c?=
 =?us-ascii?Q?oZUtG9+Jlk0YGN2lJ2tO9AGb7ObxQYtxUYC9WTwx6/akRX4NqPXz9tBXrfmV?=
 =?us-ascii?Q?C5d6zO6/fJACYFrmXOh+seOF9/7hrhSCPS45Z8vrOnLwVbQ7vATBdI57UVKR?=
 =?us-ascii?Q?KAA4AJMQrn6lOw8TDbogwqX6QcZm9j7p84IaCp2dqpCQ//aFeQD4G4EOj8Ej?=
 =?us-ascii?Q?62+Fqou/vXHtMtbQhvRfoB7actEkaOlg4WLBxNJhmNPi+U/f9eCv42n1kwnx?=
 =?us-ascii?Q?eh8MKiNyNQ2EXaIZ49mvUZDRnTq6vFfIPGOVIUKTc8HoifP0ubBKNSK4RNCA?=
 =?us-ascii?Q?WJv11mw0Y3txTflCVJuhgUelz+PWQ7Aq8WSiSn0UcuLS67xVjmeLyScbd0j5?=
 =?us-ascii?Q?51cAgLsh/cK+ggc2baBJZgwEPbH+eL8ul2u3dom9o+//OSguyBuW0Zbae8u4?=
 =?us-ascii?Q?6aD9WEetx/eiYDbg/VidoPbut/AZG1BlN/pvBG8Y0d4M7RLuGv3xGmMoZteA?=
 =?us-ascii?Q?F/9BbJdpZNhRatUuRMjr40css5PJxewxuM+z/Gqfz4KfsiW2vvU8Ojy9oyVX?=
 =?us-ascii?Q?koIcs6O8LRPZ4QkvUHXtwEXdmsf+5IVOQdOJv2z8NAq3V417zthVmkVhUVPL?=
 =?us-ascii?Q?O9MClFrSEjLn5DL0jR9/8YItSxDZ3OOI1DkcjuSiEF/LJQtnC8urZdjuo3oc?=
 =?us-ascii?Q?e+avwJNaAACDh+UwVIDdHNdpyYooIRbXGPkq6UOobZx7vDLo6N4i5uVh8eRk?=
 =?us-ascii?Q?MF+SAV5ONd+eKIG6EOHUE5W8bE4Lqg4uWX3AOrGH5pnO+nCP6PYf7/gKkHX2?=
 =?us-ascii?Q?qKGKF1bMXOKkIu+XNTMMVZuQ9/2ygP0oSFR7gNGQmESKv0Gf7Ye6yrPoOXQd?=
 =?us-ascii?Q?XUn3kpiNI1tZY7bqZiRGq0xGrOC3qUBH63cBpvYZAxmHR4hfNYnU6V+r+sr4?=
 =?us-ascii?Q?Zov7Gw7Y1jvQ2IHpUerMhOgqfF5sgK4XeI+KjjFURmBFqdNheg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hWCJ7F0SEXREZj01BsAg7Y+jBCp0lWrtpTH1VMtxR7Q58tY+ykavHKtmo5B0?=
 =?us-ascii?Q?TjGyzjtH6to1LU+I16L2L4gQIMrozShz+sokwenRa/hjE1aQGhPilu03qdxl?=
 =?us-ascii?Q?kSOqgvmCnAhzv8jtgTyMEwBpGRfDZ4PSPsOaBqywbMHgiNdG0hpTkXhKlSAC?=
 =?us-ascii?Q?bKa2RHbz07KMTQdTVothoixVLG0Shgj7LFqFdh6QpxPBYH85/63Qmeyjc9p0?=
 =?us-ascii?Q?XKFamR0WxABKn1c8Hm/UPPBP2R0bLld9aPwCpFLWjmliMNjrWkcugKynTJKA?=
 =?us-ascii?Q?rHBuF/seRPMp94oVM6cSnFwg7Y3J2ABpC0gcieMOvttFk9gJ3exC3MXMe0EI?=
 =?us-ascii?Q?wY/C9Ew+lQ3esqYOv87NuA52kyT6/XER6jjmhxfXMRJvii+iAElAAzRhoaz5?=
 =?us-ascii?Q?CAzB0HvKkU5FNSMiwAvUAXsun04Ox0qDTOM85TUWt9mG4gj6ypolUY0s3c2y?=
 =?us-ascii?Q?RsOntnXoPVvwKyVNalHLcR9x1yS9dFGEOXZ++cHu2WToZtiskHqieDFNF6Bk?=
 =?us-ascii?Q?yYqNh3PI9V4Gm9Ov7N/RV9e2EB6Q+fzPVNRszQXHFcnVDkZAwCRas+dfU1oa?=
 =?us-ascii?Q?bKvYST+XIXcS52tVuCa62XcbhXSpo2IEZy8jZFSq5IZdKeNELPOjVYD0w8pz?=
 =?us-ascii?Q?BXbu7kI4xsM92IRn2YffUwAN/SpQJn9mwYbycVpOkYTj+Tx0ZhDWVHF4iLtH?=
 =?us-ascii?Q?udfMDG9bbeX+y4lM5kBrUnVA8Krw3RncSZsOnJw+2RIRgVivjKxTLfZfHU3U?=
 =?us-ascii?Q?6MADyrJLqVdzZiGJJTuj75REs6LL/d14ReDAnVa6EMihKjPHVcCyzUOXHzu3?=
 =?us-ascii?Q?PxF7mk1BqAfgOZdrXHhY2aCBxQLZAiTJpQV4Fw1oBmoEvpL9kRzeuHXilD64?=
 =?us-ascii?Q?be9eSHczLmJAD/CvEhjJCtoEVV0GCzsRBgjTjlrCXkmSovSbK8mCOSymI98x?=
 =?us-ascii?Q?jR8X6ykIGPdZ5ahxv/5TWtIuKcUqROavX6IamtW6rOBaQbC+y5uV4TrNXuiU?=
 =?us-ascii?Q?cpvkdBM3n0fSfI6l0TARFozvPnnyhx/XXKeupXiZpURjkEdm9Wt0pY51u5ur?=
 =?us-ascii?Q?qiqmvjvuOd9BlvmrfHtco2vUDyacDJehBWsqjZWzvX0LVfVMGuKCFGfFrSFx?=
 =?us-ascii?Q?zHstBnoyFFq6Mi2NK0XRV1J62WA+SJreMmmQlpS7ROABKGwUugaurUhGh9sm?=
 =?us-ascii?Q?0y7jgOWjAbeXK7dAliEv3CE53v6MKCjyp/WjxQJf23job4LUW2vqPuaX9Hx1?=
 =?us-ascii?Q?g/HnsOt5eYoZyswCKkqwnadJUFgKlv3RAWr4ugfpjUKykc9vv3C8visCBPke?=
 =?us-ascii?Q?3WQjk52aZqwEK+XMlQ2/AfWhYZW3lxbsMLeqRwfBXucyVovVUPNiKfk0fuby?=
 =?us-ascii?Q?XzM8hokDi/oZsmdMK1RCbZVgPKW/B0Qh37RJdTjMUVmwEpPczfQMEGWLb/jB?=
 =?us-ascii?Q?nw/K+khDePP2nK3UWt8OpW9d9AWeQzq+JUY9fDTY+84OXafXFTQofk9d0uxG?=
 =?us-ascii?Q?NY4e6H+5Xwa2AU9vetxSVTzm4e4HIgdVSmaUfnJu5fiK0I1eyhZVM4R7P1p2?=
 =?us-ascii?Q?ac7g3GkwxMCsEAcZ484=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f02494-a732-4828-bc5e-08dca796b83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 02:01:35.7551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4WRf9BxHzU9PNjBhbIRm11mgskpNR82m+K6VBNtvJqXgeIdV3F91k9paZh6s2cWiXpp66ERFiz8UfHQawqgAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_190144_122610_0B33109F 
X-CRM114-Status: GOOD (  31.33  )
X-Mailman-Approved-At: Sun, 21 Jul 2024 15:11:52 -0700
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
> From: Frank Li <frank.li@nxp.com>
> Sent: Thursday, July 18, 2024 9:59 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: miquel.raynal@bootlin.com; conor.culhane@silvaco.com;
> alexandre.belloni@bootlin.com; linux-i3c@lists.infradead.org;
> linux-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v2] i3c: master: svc: adjust SDR according to i3c spec
> 
> Please add imx@lists.linux.dev next time.
> 
Thank you! I will add it at V3.
> On Thu, Jul 18, 2024 at 05:13:28PM +0800, carlos.song@nxp.com wrote:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > According to I3C Specification(Version 1.1) 5.1.2.4 "Use of Clock
> > Speed to Prevent Legacy I2C Devices From Seeing I3C traffic", when
> > slow i2c devices(FM/FM+ rate i2c frequency without 50ns filter) works
> > on i3c bus, i3c SDR should work at FM/FM+ rate.
> >
> > Adjust timing for difference mode.
> >
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Reviewed-by: Frank Li <frank.li@nxp.com>
> 
> V1 have my signed of, please keep it.
> 
So sorry for this! I will send V3 and keep it.
> > ---
> > Change for V2:
> > - Correct I3C clk configuration and simplify the code:
> >   Pure I3C mode and MIXED-FAST I3C mode just use the same i3c clk
> configuration:
> >   1. i3c push-pull timing is 40ns high and 40ns low at 12.5Mhz
> >   2. i3c open-darin timing is 40ns high and 200ns low at ~4Mhz
> >   3. i2cbaud should be different between Pure I3C mode and MIXED-FAST
> >      I3C mode.
> 
> V1 get Acked-by: Miquel Raynal <miquel.raynal@bootlin.com> If you drop it
> because big change, you should mention at change log, said not apply Miquel's
> ACK tag, because below change is quite big.
> 
Do some code change and fix a bug, there is no big change. I will add back it at V3.

> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 31
> > ++++++++++++++++++++---------
> >  1 file changed, 22 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/i3c/master/svc-i3c-master.c
> > b/drivers/i3c/master/svc-i3c-master.c
> > index e80c002991f7..78116530f431 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -127,6 +127,8 @@
> >
> >  /* This parameter depends on the implementation and may be tuned */
> > #define SVC_I3C_FIFO_SIZE 16
> > +#define SVC_I3C_PPBAUD_MAX 15
> > +#define SVC_I3C_QUICK_I2C_CLK 4170000
> >
> >  #define SVC_I3C_EVENT_IBI	BIT(0)
> >  #define SVC_I3C_EVENT_HOTJOIN	BIT(1)
> > @@ -535,6 +537,7 @@ static int svc_i3c_master_bus_init(struct
> i3c_master_controller *m)
> >  	struct i3c_bus *bus = i3c_master_get_bus(m);
> >  	struct i3c_device_info info = {};
> >  	unsigned long fclk_rate, fclk_period_ns;
> > +	unsigned long i2c_period_ns, i2c_scl_rate, i3c_scl_rate;
> >  	unsigned int high_period_ns, od_low_period_ns;
> >  	u32 ppbaud, pplow, odhpp, odbaud, odstop, i2cbaud, reg;
> >  	int ret;
> > @@ -555,12 +558,15 @@ static int svc_i3c_master_bus_init(struct
> i3c_master_controller *m)
> >  	}
> >
> >  	fclk_period_ns = DIV_ROUND_UP(1000000000, fclk_rate);
> > +	i2c_period_ns = DIV_ROUND_UP(1000000000, bus->scl_rate.i2c);
> > +	i2c_scl_rate = bus->scl_rate.i2c;
> > +	i3c_scl_rate = bus->scl_rate.i3c;
> >
> >  	/*
> >  	 * Using I3C Push-Pull mode, target is 12.5MHz/80ns period.
> >  	 * Simplest configuration is using a 50% duty-cycle of 40ns.
> >  	 */
> > -	ppbaud = DIV_ROUND_UP(40, fclk_period_ns) - 1;
> > +	ppbaud = DIV_ROUND_UP(fclk_rate / 2, i3c_scl_rate) - 1;
> >  	pplow = 0;
> >
> >  	/*
> > @@ -570,7 +576,7 @@ static int svc_i3c_master_bus_init(struct
> i3c_master_controller *m)
> >  	 */
> >  	odhpp = 1;
> >  	high_period_ns = (ppbaud + 1) * fclk_period_ns;
> > -	odbaud = DIV_ROUND_UP(240 - high_period_ns, high_period_ns) - 1;
> > +	odbaud = DIV_ROUND_UP(fclk_rate, SVC_I3C_QUICK_I2C_CLK * (1 +
> > +ppbaud)) - 2;
> >  	od_low_period_ns = (odbaud + 1) * high_period_ns;
> >
> >  	switch (bus->mode) {
> > @@ -579,20 +585,27 @@ static int svc_i3c_master_bus_init(struct
> i3c_master_controller *m)
> >  		odstop = 0;
> >  		break;
> >  	case I3C_BUS_MODE_MIXED_FAST:
> > -	case I3C_BUS_MODE_MIXED_LIMITED:
> >  		/*
> >  		 * Using I2C Fm+ mode, target is 1MHz/1000ns, the difference
> >  		 * between the high and low period does not really matter.
> >  		 */
> > -		i2cbaud = DIV_ROUND_UP(1000, od_low_period_ns) - 2;
> > +		i2cbaud = DIV_ROUND_UP(i2c_period_ns, od_low_period_ns) - 2;
> >  		odstop = 1;
> >  		break;
> > +	case I3C_BUS_MODE_MIXED_LIMITED:
> >  	case I3C_BUS_MODE_MIXED_SLOW:
> > -		/*
> > -		 * Using I2C Fm mode, target is 0.4MHz/2500ns, with the same
> > -		 * constraints as the FM+ mode.
> > -		 */
> > -		i2cbaud = DIV_ROUND_UP(2500, od_low_period_ns) - 2;
> > +		/* I3C PP + I3C OP + I2C OP both use i2c clk rate */
> > +		if (ppbaud > SVC_I3C_PPBAUD_MAX) {
> > +			ppbaud = SVC_I3C_PPBAUD_MAX;
> > +			pplow =  DIV_ROUND_UP(fclk_rate, i3c_scl_rate) - (2 + 2 *
> ppbaud);
> > +		}
> > +
> > +		high_period_ns = (ppbaud + 1) * fclk_period_ns;
> > +		odhpp = 0;
> > +		odbaud = DIV_ROUND_UP(fclk_rate, i2c_scl_rate * (2 + 2 * ppbaud)) -
> > +1;
> > +
> > +		od_low_period_ns = (odbaud + 1) * high_period_ns;
> > +		i2cbaud = DIV_ROUND_UP(i2c_period_ns, od_low_period_ns) - 2;
> >  		odstop = 1;
> >  		break;
> >  	default:
> > --
> > 2.34.1
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
