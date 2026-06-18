Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D111BCD98ED
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jun 2026 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1JdFia5xjUO2tpevuROr7Grlhu86uu7anZGynWqd/U=; b=AU8ENYEYz0OAh/
	kPXZUvqkY6M6425Hzye4in5nmtO44HQDj/+ec9YsX3EF1hr5pMrZBWXbKiNggNRdsVlWD+WvirP6i
	bdFK5bLxSEujlH3Tk245cci9MM0DmSiOxDgxGtxp6gvUpz2I6AiPbyeipEqguK8zQtmghWZIc2Z9y
	Z6Iohlp27OCgkoZeO5OuwosZ6oBqnSzzyZy4hfZj6+fN+MA5rkxGNKl1V90PNwxrvMhU1rG2R2gB/
	Kz7hq5ELS3EhokSIDEwgx8MW89LXe9wvj9ANuGdAsmk+vrKkd9yeQhNtdVDTcpGOX7jnRQbnVpgPM
	8G29szGlV3oBGEu7o6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waInp-00000001kpI-1B6K;
	Thu, 18 Jun 2026 19:53:29 +0000
Received: from mail-northeuropeazon11010046.outbound.protection.outlook.com ([52.101.84.46] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waInm-00000001kof-1mZb
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jun 2026 19:53:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geRG7az2MzyiXW/4gp6HJLJXNgc5vcQtIWJGM4+qf6YyiDnIE0bK7WAfeH0MzZQgYVq9dgr9peQpeZWDHbhO+fFp96KcN2CCFCxU/efqc+6BKTzMBufGoKKJTOxmFXFuVuLvwVh6Ej/F9/PrU3DwnuNtAFGRwSWcOhE/7NZaBPuRPGoI1zxOZ0r0uyqgZPWZFTQ9rK42aqbjFCbVkTzLHwh8EcdIctMjaR49p5K1zVt7vPbDySwbWCASDKZw5poXMoQpRqACunMutch09IjX0hA+HhbCziXwljuopAkD+U/YjUmEbPDz61/vNnu/934DPyEwWUZ/xJncu7NKELQe+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r20S8axy1BJDJn5RsnYRtrT3yic4fYi5nyaMgkjmxto=;
 b=hdVdSEuDFJyIbwogRVz3Vx7iggdGLu4cnVl4QYfU+q1NfTb8Dv2lg0Q2pdag8TpTYtIBk8OB22GsCX8ZH5B7qhz7LOVmlTFYbJ+X75qnEGSTwbX0WCXsqVmoDI3b+0luoM5h69nJpBW7qbiHYVb8KAwyv2EItczeHWR0YwyCChXxy9qFDFGW5+0RfqiD5gWjJRkzU8GflL3BCBLUnfqMowPdVeOnhRw2PdCebAZsXOkThUhZ4jqrOuOCQnHhotShPCOFaO1ZJ1nUHkt0ZNvTOBq3Q7mNP2bU8NbnLEXqVhcTn6vqVIDsvh/GsrwiEpp2C8wqsgiQQ6NwgsykmohdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r20S8axy1BJDJn5RsnYRtrT3yic4fYi5nyaMgkjmxto=;
 b=elvgv8wXE7apgbLKixMFIawb4iggRJ0E+Otq1SiB5jULkE7UTg0uv6t9lyLdwJapGT2169P/fxgJ2z2N0x9yx33aYenz5eMiUnRf4lBbgbbRV04dNhIw41GLZpmkFQ77yql6y1+gG8f075xYzyaErFIpZLoH25/D/RDCW15f7XO6JtD1UkROYPQkN8vZ6oNcov1FME2chIGUJokuciQ2GhRBYWq4i88aimmvthGRHLaHK5TVo2yGqfVCcmyhaWMkEkl295JZ3z1imVmhp9CPyL3bRz6XrS7CwYYFrrqGmYq9w22LkQMRIn20Y6iRSk5mWxLCaAi6j1wVqE7WD8Kjxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 19:53:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 19:53:22 +0000
Date: Thu, 18 Jun 2026 15:53:14 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Akhil R <akhilrajeev@nvidia.com>, linux-hwmon@vger.kernel.org,
	conor+dt@kernel.org, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 03/12] i3c: master: Support ACPI enumeration of child
 devices
Message-ID: <ajRMqilbGEi6CsLc@lizhi-Precision-Tower-5810>
References: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
 <20260616101515.34CA61F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260616101515.34CA61F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:510:33d::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dc6ad7-db5a-41b8-0f7a-08decd734071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: aW57iFP5XW2SMlQ3PWfV6x3BUvHxWPCksLBx5csVwA7uJiAcoNw9twp3Cc5oV0NZk5KVmTIe3yLMIg8nNfASEtdXppH5PoCMOU2yeuSoWz4Q5E4tLKWZVWoDdRspvVOH7ELwK/l5dT75b3pI7OFqJJDOaZBjFPRnEUFuLJkn6Kl2gXUYpDdW4A9iy8jQZxDO0+Mm8xFm3oDhX4mytIxKGw1P1u1yE97Ja14tyABl1rxBhOwPulsrQ/gw2o1eaLd1/hUEQoL4X+603OcKN9gwbQxw2OHRKi9xVgMUrP9gn7FLg71Yb0kjhleA4jx5ExAFE5hSI8I/fpNGdqH9Hiy6RNjaVpphqgr4wrLDLq23dft2hev0vDUWWU4YaMlcJO+AYOUfgOUZl580DPVh5C/5ceHbR0zpfnytPPsxPWWYQ6F4UoitZ9yJ3pzWk61iqwc7mfNAvpibBG1vOZc4yiBon+ipqhmTT668XtuyBFOR7af6aQ0C0VJMV/4QGsov9Qf0cvJkOwJSf2OXTni3TaTw7Q/2OwHPcaNCn/Tu/PZ3wSrDBDtP5d0E0dTbJ/vKuvimISgLIAgb1EhQIPbd3UyjIGYH+9Di1DZbsBKOusnS3ys=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jNjiBggPr6+fB9vF8hEKxjqUZqaIDveMp1e87NfUBAoT4vT4SVgU4rDPJE?=
 =?iso-8859-1?Q?n94/WH5oByk6s4aEJFF4gPIzwjcnFbztX4MTQNiy1Kr3QfAbCEpXTEjAp9?=
 =?iso-8859-1?Q?hLEgnvhbJQ/FSW/hxA3eezI5yiDfXQ/7UXaLckxHdjrYQr//n0603ctpHY?=
 =?iso-8859-1?Q?BQU0e74uZ0biAb1DsNZFcfxCeF5F2pmHtrdBa8iV+K4Qyjt9aK3zeQm0/0?=
 =?iso-8859-1?Q?62MoQJFpmGTbdX2ekBYo0UZYkwnkqib47H2d6HUDINw0RxqcIra+udsYbB?=
 =?iso-8859-1?Q?Z30eIkKGrDlMJ9VLhbRXSet6ZMIUi3uCwy2NZOXHng+Lbt8i+6ncxOs0fD?=
 =?iso-8859-1?Q?X4kdi3nbpYSeF6QLPyeJh66Es1Lj6kvzgz1++UwJC3kC5DIHcgNcdWBdQm?=
 =?iso-8859-1?Q?bNfcavheuZVdSBej4ToAdkn892Ygue/jUNrI8/sh9X7bS4S1o0GTdTaIXH?=
 =?iso-8859-1?Q?HK9D91VtdqF9tlv1RjqsfRQcEEMFPSIWMGivP3PcUahyWxKdKC019xoZoT?=
 =?iso-8859-1?Q?wS+W7uLPFgD5xXd3vzwZRC06V49QzceSFNwrrI60Rh4gBD0k0qesEnKRUd?=
 =?iso-8859-1?Q?IydoWwJIk397bbfs9BUoNlBFwhBJ2MO3qsyCoVOhCt3YjDw+1T0M/mqNA6?=
 =?iso-8859-1?Q?mP5kbv5yu2AGsF1u1InW+tbpmb3VuIPHaxd63SBaEBGUMHalb2rEpMSjVp?=
 =?iso-8859-1?Q?ddxQs8/DUI+sUHWTN7D69vCsSqGe6F2fQ0f2ZjwqzgAZ4kT1pDwYI2BuaA?=
 =?iso-8859-1?Q?RFcXAsNmbIFMmL5pHoQg7onGEy1qUK1oZxVxEKIpNdq1kkQLq4xNUxKg2R?=
 =?iso-8859-1?Q?5TywaMPIaq+O702STRx7OX5zL8SNYAe/Sz2b7LPsthNgVPe6ZonRd2lG9k?=
 =?iso-8859-1?Q?4udMaBuqQ4OqwFNfiTOzRHrMtOYtd6VuRW7Nv0cXt1NrD829SMn3q7FkH4?=
 =?iso-8859-1?Q?fTDPfifGyAROXzzZFcmY3kWvsolovaHnD84x/LWDJtvRjgoI1H9Y9vUPK5?=
 =?iso-8859-1?Q?r+o48ODnjDUjf8Zm6GYs9goBDGEkJrDKWLsMqui2GPHJu5a41OAIf6FvPo?=
 =?iso-8859-1?Q?QTQN65mw9rTBM8OvTEKEtjrghegc2P7LiDXJPA6JuTmaH14uiZfCMCd41A?=
 =?iso-8859-1?Q?vnlHnuueTuNCbvqJNUGyw68e7lYYh5I/9Xp6VItFmB0mONtfAcgQB5EcQr?=
 =?iso-8859-1?Q?0GkDBg8qkGIS1/bsUS/Xli/SKzxM/jRA9NKGIV+P5z0gFxwZiZ7DNIrsCy?=
 =?iso-8859-1?Q?HllAldl4sgic8C2qt3oeU9nmDUgTypMCWBGD2Ug9/GyZl4DzHjWfsFO96O?=
 =?iso-8859-1?Q?rpTCdcLwaqOvyoXUno43ctt2SgK0kigVv1X1EWoNPm6arDCyAWWQiyWmvy?=
 =?iso-8859-1?Q?y9nFb57vIbEgv6G7kO6/hQxyNg2aN5oTpwkeS/+hmctLWWMDEkLkVqiX9+?=
 =?iso-8859-1?Q?FTu/ZR2fQF/35jiUp+VemPcXTLHoDbcE17Lnap+JasfAOVlWy1cHoqwYxk?=
 =?iso-8859-1?Q?sEpJRtHALrLpPJUuu1SBAA9ZvRkgO/g5lP418RiXqetixeOBFJ8P4WlOZE?=
 =?iso-8859-1?Q?T3xUS+8kDsa9vXXRXeB1SeWymQVGt6nRuUqLvWJKtl/M2BPCtGmB+OtRuS?=
 =?iso-8859-1?Q?zk1oE/UXOGvrS/Sin1cTEK3Qs4plJ4fKCbLJFoPHJr3LIi7Pb/+a0oNVGG?=
 =?iso-8859-1?Q?+wvDSrGL2bvbhZOYuHxiLNmaYUb0cPb8nzNVsEQJe5+0thjKMXFOKCUKTs?=
 =?iso-8859-1?Q?QbRjQNoBl6MCPvp4bQN5w4fthejQinZgHmdK7mYVKq2xJKDhYmndIk2Xl3?=
 =?iso-8859-1?Q?9O88GQxbRjN+V2XXk8m8yu413lcm8Rvyaj1vVXgv+L2c56GFTcju?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dc6ad7-db5a-41b8-0f7a-08decd734071
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:53:22.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Flu3tTFIuatq5rQdQ8tK+VWgZOq+zsb1Cu+AtpnFDaN8Pigz75glzGs+ohAmyjANNpjZ6gayZSEXqMBvJ1c5SKl/jOfAmrItlzUeOCYTvKi9XpZn8y9CUgm8Q5fCWl8n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_125326_472450_B6CE567B 
X-CRM114-Status: GOOD (  22.07  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2026 at 10:15:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] devm_kzalloc allocated 'boardinfo' is leaked for every ACPI ch=
ild node that is ignored because it lacks I2C/I3C resources.
> --
>
> commit 9a388c2056a553d628ce4b8b623a812d4aa08951
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Support ACPI enumeration of child devices
>
> This commit adds support for describing I3C and I2C devices via ACPI tabl=
es,
> rather than relying solely on the device tree reg property. It implements
> reading _ADR and LVR properties from ACPI resources to retrieve the static
> address and other device properties.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 3b19a5e8f46d0..f0e05bcac26da 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -2708,6 +2762,74 @@ static int i3c_master_add_dev(struct i3c_master_=
controller *master,
> >  	return ret;
> >  }
> >
> > +#ifdef CONFIG_ACPI
> > +static int i3c_master_add_acpi_dev(struct i3c_master_controller *maste=
r,
> > +				   struct fwnode_handle *fwnode)
> > +{
> > +	struct acpi_device *adev =3D to_acpi_device_node(fwnode);
> > +	acpi_bus_address adr;
> > +	u32 reg[3] =3D { 0 };
> > +	int ret;
> > +
> > +	/*
> > +	 * If the ACPI table entry has _ADR method, it's an I3C device.
> > +	 * Otherwise it may be an I2C device described by an I2cSerialBus
> > +	 * resource. If no I2cSerialBus resource is found, ignore the entry.
> > +	 */
> > +	if (!acpi_has_method(adev->handle, "_ADR")) {
> > +		ret =3D i3c_master_add_i2c_boardinfo(master, fwnode, reg);
> > +		if (ret =3D=3D -ENODEV)
> > +			return 0;
>
> [Severity: Medium]
> Does this leak the boardinfo allocated in i3c_master_add_i2c_boardinfo()?
>
> If an ACPI child lacks an _ADR method, i3c_master_add_i2c_boardinfo()
> unconditionally allocates boardinfo using devm_kzalloc().
>
> If the node also lacks an I2cSerialBus resource, i3c_acpi_add_i2c_boardin=
fo()
> returns -ENODEV. This causes i3c_master_add_i2c_boardinfo() to return -EN=
ODEV
> without freeing the allocated boardinfo.
>
> Because we catch -ENODEV here and return 0, the overall bus probe continu=
es
> and ultimately succeeds. This means the devres-allocated memory stays tied
> to the master device, leaking sizeof(struct i2c_dev_boardinfo) for every
> ignored ACPI child node.

Is it true?

Frank

>
> > +
> > +		return ret;
> > +	}
> > +
> > +	adr =3D acpi_device_adr(adev);
>
> [ ... ]
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260616095429.39472=
05-1-akhilrajeev@nvidia.com?part=3D3

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
