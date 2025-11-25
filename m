Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D83BD0EE0D
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Nov 2025 17:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPXO0SyifqKHGBfeHwxFtze73eNzuZGERGEiX9gOmfM=; b=Ngj07jnHV7Mbgu
	2nMpCBxbd2uzLb2VRaTYZsCmCIbqimcP9B6XErAuaA++HcBGUl0wOHByx67yS/wKOlSK1sudjwkE3
	M3q72eCGAWsHZ4fidiv3Zj4mODoirSezqd/Cs+RC26WP2T4VTb0+Tc7DScJ0j635uazZxeUck2Lps
	4jtNw2RfnG1jkuq9yBuG+rRHge/CEhaAuz+qya+gVjWdwsdjN6+jHJGOIuLJolV8Er9GdToXGkUjb
	H35o/HHr6Xm2mCjel0mtBonf+bWGMSb0a6StJdMBic/X7hxfJojt/jkdbFWBfXgyLOnxrrE4517L2
	dyD3+TMp07h+dtdvPh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwWL-0000000DeT0-0TTR;
	Tue, 25 Nov 2025 17:08:05 +0000
Received: from mail-westeuropeazon11010068.outbound.protection.outlook.com ([52.101.69.68] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwWI-0000000DeSV-3aVJ
	for linux-i3c@lists.infradead.org;
	Tue, 25 Nov 2025 17:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIaeBgyJfm/NIoN3UABI+v3pFsAtI2kYf8Zv293fkSS/m8j7IZ+I6Zo8GB7rx1y0sc9hrriwkLO/MzUmyv4oQyvlALfajlsEofKBL5k6dkRe3M/Av7gq024ETaB+/chC+avlJ+rf3Z4yJu9uNJsNmF6LJ1jLm+g5HPWt7m0+v6E8gmaBijeVEtXXrh6VCikk9UDY7e4kMwAtVl3wV6gRrkszG4lvoP1ftPbYEwT+jpvVcBruC57DQ5fBRfHKKBl4sJOK2wrWg5QV5Dw00eAKgPDsgkSaGL0VM0xgRV5FWGDzVpbLH9GYRFEhoyssj8X+pUkbsrTzXIdPQJ0UToMlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUQVilgK2g3MEZ2Q5aYYR6eZb528mtABDYGbfZvqq34=;
 b=KRO02rcowD4RGKWArPrdv+n2OMpIaf/oycmH6lEIltl7nS2oghHvvNv8RFYsmQEDU1ztrrSHyewn8BtsJ/3djgWQAX66jhYInxZKBDE0nAsE9HfQAJVLiEqhJHDp6pWqu9WsYe8EPFOzgxzfWMvgY6UIsct+CSQjFyzvejRJPnWmDrNFxcfgTzV1Uu1FV0jGUuceB4oB4uOgksi5gw2TJsgzoiGh4OUwq1TzO+yJ/WBkjiG4fK6LNPSnUSHQV4KPcb0+PnMEmToErVZ1cD5YPMqV5QEzEuJt/8fJ7UmF27tMjCw5IcV/+XZEJ7HUy+s/KAvCkLherejnNB4mT/ew6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUQVilgK2g3MEZ2Q5aYYR6eZb528mtABDYGbfZvqq34=;
 b=nhAlSdTz7EjtuJ6Rq/r5l6frKEBiiuow5R+kwFk4t59cqJBUbZVSr5dUYt9mXvj7AvOuzyVp+wOcmD0STBAie76yHH4bdhG6DZXu8Z44Ozs0UENB/Aay9lTztMODJ8R4zsK/A1LEtCx69yvtiLuTuLuCU4Vf+uxv/ZifyBvEkpdWareR4G/vAXiNwp0aMGxcYEHoJNpZanBmdSsqkX7vz/d/3unqkPo5sFOiQbq5YGlRegLKLlyfhx8jEvebCF2LtmIWoEE/aipptfZZHBZ0MHcA6DXuFigtO6ZDcqLfB7bG5wUFtPomf9qRPgf425c2yzgF8Zgu4OfRtbWQTCJ2uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8136.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 17:07:58 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 17:07:58 +0000
Date: Tue, 25 Nov 2025 12:07:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: "Ng, Adrian Ho Yin" <adrianhoyin.ng@altera.com>,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i3c: dw: Add sysfs support for Device NACK Retry
 count
Message-ID: <aSXiaLxdmUh6fPsI@lizhi-Precision-Tower-5810>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
 <a700d805a5f3a04791bb4516d6f67f6bd8a80616.1763747151.git.adrianhoyin.ng@altera.com>
 <aSSdEW4/WCpGxJ/o@lizhi-Precision-Tower-5810>
 <f5ff6901-ada5-47ce-822d-11aa35adabc9@altera.com>
 <a09b21bd-84b6-435e-b6e0-fe94c9e62f4a@intel.com>
Content-Disposition: inline
In-Reply-To: <a09b21bd-84b6-435e-b6e0-fe94c9e62f4a@intel.com>
X-ClientProxiedBy: SA9PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:806:23::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 25103fa4-8352-4916-c5b7-08de2c452e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U/FEjqkWeduGIzbbef72iQyL3E7VhF5EMHeUwwyKz289+Umq7CObWRLUmo?=
 =?iso-8859-1?Q?bt6h/CS/YXyRgX3mf25akTCH/yOxeBwWupyJUzVAJrBYe6VAiksI9WVGjY?=
 =?iso-8859-1?Q?eALcJXvAYkt4nO8Iy5P4k92DUwNK6kZPGQnFQLsTgzatOHDIjdMJsxYoU9?=
 =?iso-8859-1?Q?jsptOEVGnVcf2FgWagqcpCItamir3r3syYXM3/5eayopFOHs7bNJIR2NEr?=
 =?iso-8859-1?Q?4f5HrS89mF3z55UF3w0QRCRw9eh8qGnBLdc4+umf330L+Hn5YI5/cpDOft?=
 =?iso-8859-1?Q?BDy+UFBjVMHQrtlOasq5/rGh+UvdKBhCZqMQh0NFS4PTdcMmj26c41t3ro?=
 =?iso-8859-1?Q?yY4rkLUbmWwdg8qzO54MRjMOmcnu8sa1FijHHM6Ae05h9NHlGgI8kF8hmZ?=
 =?iso-8859-1?Q?Ms8hx+5fU2fdxMvr2qDFs/D92FmgbXMzLm39uLhG/tc0BWWi/xuRDwm4Uh?=
 =?iso-8859-1?Q?1nhgYAGbAk6ZLttGkFgjjCCYNJFYiywl15QWK4GOnNiORRUtOKRwcpfSNg?=
 =?iso-8859-1?Q?W6Io1NW6xPpCSncb++P2Z7NIWH0KyPf4xU1Wu+gsw+pssH/b+UOs0s2LA3?=
 =?iso-8859-1?Q?SPcTJBMcCLRYToAqB8/ZsPhfxD8t0+k32xiLPn3FKMs+mlI160+Jg9yPWA?=
 =?iso-8859-1?Q?R0O4ithzrzqN5u6h0aJN1SyAiVAN620qKGTagDjTQ+xJGVvv/ZT/eGUz68?=
 =?iso-8859-1?Q?z2Hh5tC85FIDYrGYw4v3lvWvKfRkgAXVcIRTcOI5baF5604Kmx6Lg30/79?=
 =?iso-8859-1?Q?SR3bCeRbCSjRvMf6LKUPctj0yPX33EZ08iDLkF4TAYESXb3LiWiMTpVUz8?=
 =?iso-8859-1?Q?p8tfkV9/tAoiPX3arZFuw7po8jzYADck58CP5r7zsGdLOmkZR+CiDjzAyH?=
 =?iso-8859-1?Q?s+tNpmNYeQs0ExUMnwTYMHOHMUfZva4U0jppS+EN9u5x+0u6KLRFwNYCZz?=
 =?iso-8859-1?Q?0qHPz7kQZ+/ryc1p0E/G3pcybZbiTS2Te//4csxhtWyzHvGgdmIKClDLny?=
 =?iso-8859-1?Q?IM6DEsEpszC4r6M9AhLv/4TSuQbDjpY5F08JMcAyJmP+7D8t2jjOJkUJ+Y?=
 =?iso-8859-1?Q?VbRO6dY38r89596rHDnVvhiGvzDN/4F/7EazGqeY1y7bEj4NuSbDTg1KF1?=
 =?iso-8859-1?Q?xpBBxHQ187CcuNOdbFByY8ezRPD3f5SBxc/WjnfsrofBDei/ObehhRZeeb?=
 =?iso-8859-1?Q?26p/xVkNUiwHicyT0QukPB7l9Q2vAC09+sYnGFuitK9cRl5dDX0vOJPVV7?=
 =?iso-8859-1?Q?4ltsgme1YTrCSaHrRH5KEbP7B0F48OxWY8pBfYHfMwy6TRpH43BILHYLtl?=
 =?iso-8859-1?Q?G1WL+sFYM5ZIfKkJNUi5YUJSd//5/ETlbR5gtDg6BSjk8PvlGulcw6qUhx?=
 =?iso-8859-1?Q?u+D435U6ZFxXqR2FWHCNxTsT+lagHKb9m3g//r7Druqhrt+IZLpV7VjyFL?=
 =?iso-8859-1?Q?jmsSuf+BBQxr8FlNTP8Ay5GvmQWONlvG/9u5N7Yb815kmM8eCnufQphZGi?=
 =?iso-8859-1?Q?7F2YwP8u2vajJk2Mob71jbHWOF/orbALH199bi3AFbU7ze3lYJ8NhLO4sW?=
 =?iso-8859-1?Q?5ARjwl+GdsJa+aY2Brecyna2euK0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ah95mS5hFHzz3ZP992vK0y6quVsssctda+fa1Nzh0D7fGZzkDn61Rg5ZX7?=
 =?iso-8859-1?Q?bSPSsMP/bIEYqlPnt2fC/yEUJKUNopcbbQbqGpigygg1REJu19OryJmOso?=
 =?iso-8859-1?Q?2PP6uNpliUUSNMmJuFLlZtp+DWyNAUprmBP43Q/2jbDorgh0MRrppFHJp4?=
 =?iso-8859-1?Q?vj0t3009yvYpINF9+hTQT24gAU5v5Qk8BgMSC3jDn/NboB4Zj4X2RLwh3G?=
 =?iso-8859-1?Q?SVDt1uozMOSkpUdJx8pufVhhe9N0UeHNLDRsV6qX0q6SFXFFXBPlavAF+S?=
 =?iso-8859-1?Q?IJ4UTy6rDvjZVpw5usztlU9afqFUB/8co/maWCtUWdM98TYqmLRYhMmenW?=
 =?iso-8859-1?Q?9shrtYLIYaK32qBXD0iElZpFpMAY1SZkwVNl8Yhi/9FjV9r3CM21eZJLs+?=
 =?iso-8859-1?Q?oKYsfcL1ecUCSsyhNBZWbQfciNQF13vSfEJYBAVQn5cNQVDdLPFtEMKwoU?=
 =?iso-8859-1?Q?F/ex8UqbF7U7JiNEBfnEAYBSFfDTQjKCWHbwg2BM33Plt4cfhunWNnrhHN?=
 =?iso-8859-1?Q?ekypyDUPxoAbkwGoU/O5IFE6Z/jFDCxmSQFrrYWl+nN1xgs9OQcAL46S8d?=
 =?iso-8859-1?Q?TfxDvI3aW/gMZ8NmOCWY1tQhIoNK6aKGPeoy9tpa+Q6HJr70YmpffmsyMj?=
 =?iso-8859-1?Q?lgMHJc1d5GUdWzyeGDPp/B0ZWaI8iJuq/ftJ/q4FbKG9kwqmF14LqX7rCi?=
 =?iso-8859-1?Q?yebDrxx/TRWYfMnlFGRcpFN61nX5BMZqQRspIwe7A/pleh3AVjIwqMuMOg?=
 =?iso-8859-1?Q?DXtH91DxkowgZJv1yu7TDziDvqrRCW8Tn4HeYJVpQqcG+UfCKLdDUpgtaH?=
 =?iso-8859-1?Q?wAsRHLcD1F4LYp+09ZyQGK79rDA73ndoVhDtlucXEE/X4ruwqzgOt1NLwD?=
 =?iso-8859-1?Q?lZWYsC5HYa/+9AuV8zpXmSLhOa2pWXKdtUIl5dJYJ9QMWlZZe1YkH0ptV0?=
 =?iso-8859-1?Q?ztxvzndjuoOMU7UE8ugzILqBiDrOIuBQVVBGOrayTuKPS+8ZJlPGZ01HhG?=
 =?iso-8859-1?Q?r559Uz/oTCgDCbVRz9hXwbqRxLp9Wkq4CYTN8wsfXZWoYPEF0zZKoQdbzi?=
 =?iso-8859-1?Q?4yfJ9FFDgOfaxXjkRBXxe0jtYwuDExN9Fho9aVgFG55+uXMFQSAkvamSv5?=
 =?iso-8859-1?Q?F57L0yPa5QIUUvhXpsnKgTVpNwev+rCGo5pdxdTGFzpBwHCuN4HMtvXiCg?=
 =?iso-8859-1?Q?tspX8INkp4YHL9KTP1Qcfch+7J293T4N8yynBxdpf9dwAV61vEx5lVr64I?=
 =?iso-8859-1?Q?8mkalLSSxgSKWgOsV8IMu2TWtXupZ3rohrsVLIIJreG3PwyQSQ/2va0wrf?=
 =?iso-8859-1?Q?+iiMduYimhTdGCjCDxVFcHLpq2kEtP2geaWtmlE0t9b3vtVa2lisKKvmrO?=
 =?iso-8859-1?Q?qIa6xiYfNrnnh+V4I7yEACLhQh2KHz3I5kkPFZQi815r7jZsFm2jpDbOBY?=
 =?iso-8859-1?Q?za1EVGhkZZG38pxJQgYXcI4SclPiRc7PnU3Ob6Kv7TCi1y78WckYA/kwkf?=
 =?iso-8859-1?Q?qfEeb0/+r8bz4DTJpDg1zyKtfYKvMkYttnAS6R8nXDbWNWup4o4etLiwBd?=
 =?iso-8859-1?Q?gR0tMqETW/SoeVs5AdAcegTXs3WgfLamqAez1/F9ivcBXKHf16zKViSyhM?=
 =?iso-8859-1?Q?WPrZF8179ErPNuHhKtrbAikWRLfhg/FMAu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25103fa4-8352-4916-c5b7-08de2c452e59
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 17:07:58.0001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdOgqTqtL0Ip4GmqOj14v9+EUi7PYoZ04Z8rikHE/fHk1MAlh1obxifs4fcJ6pC8FEmwqIEPyVozh4Y8vzHiQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090802_898999_1F6F43AD 
X-CRM114-Status: GOOD (  16.07  )
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

On Tue, Nov 25, 2025 at 04:05:53PM +0200, Adrian Hunter wrote:
> On 25/11/2025 05:19, Ng, Adrian Ho Yin wrote:
> > On 11/25/2025 1:59 AM, Frank Li wrote:
> >
> >>> +
> >>> +=A0=A0=A0 master->dev_nack_retry_cnt =3D val;
> >>> +
> >>> +=A0=A0=A0 spin_lock_irqsave(&master->devs_lock, flags);
> >>
> >> I think you'd better to hold i3c_bus_maintenance_lock() lock to make
> >> sure not transfer on going.
> >>
> >> Frank
> > Hi Frank
> >
> > i3c_bus_maintenance_lock is a static function in master.c. So should i =
update it and expose a public helper to take the maintenance lock or contin=
ue using the existing spin lock to protect the DAT updates?
> >
> > Thank You
> > Adrian
>
> Other controllers (e.g. MIPI I3C) support dev_nack_retry_cnt.
>
> Seems to me this should be in master.c anyway, so it can be shared.
>

Agree.

Frank

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
