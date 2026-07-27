Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DAFC531D0
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Jul 2026 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKLcO8imkw/uYyzq8heR5Q66F/dE0nB2LXnlqg+sjDA=; b=a7HDclCovvInfF
	cmOAP1iXBPVAHZcgUPYFKFqNwSJQTUS4XHjNboehfgEeU62xRdpLw97UoyZHNLmsm5Q7Rd1t7ZOHT
	gVp9CfZCnF+rDYx44k2CIxHEouvizaEkCU97uT1ycCtcE9YzAIRg0EqXgqTv0CVoGb91LRXkp7IOj
	U56D3VQwdq4ILqkupI0fxkY3ezjDfLt8Bom3nwP2gslXbVieQPixAuDokX+hNKNT8aTYBLa4bcPEN
	rn9YIis8PCMUGZEyb20ftvkMXbGAHLOj3BfHjzrNu5z2yQ1VyzyVhbspKUNOOjN82g2Qjr9FnUBDN
	O05B6Pci/HWvyhFOzzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO0f-00000003HdL-1Mnd;
	Mon, 27 Jul 2026 16:16:57 +0000
Received: from mail-northeuropeazon11011050.outbound.protection.outlook.com ([52.101.65.50] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO0d-00000003Hcn-3xHk
	for linux-i3c@lists.infradead.org;
	Mon, 27 Jul 2026 16:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+MlUITD1Ux+89BoMJooqwFI+hnQ8NfnHoBzvlKambqCsDM3NnO3YrLJRTy2nwDapW7EshYVqEpNtogRXrccj4O0WQlzVX6lBkmoS9ays1Bq3N8cJvpConTVihTPxDFURq2TGCWXUnOFHoHoVRr6965X1DyeMgn4gfPrtbKDGiES7DKXFLWtnokUth80Mmb6Lp/FL/BOk5xPj/TWARljuCgelv36iTDilk1yCWjuiZ8RzUPy9SLX5fX93XK/fu+UHpmCZoaXM41Gp4H24q1E24vXlPSU136LNXpeYuIr5T61QZfvvFnVqCmAiyB9IcS8WYIYthw6IJhsDOZzzVfxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHRhSpzn6F/jLmAhZjj/PqCYJNweFpGycSDsBJh5y2A=;
 b=ofYYsseo2WmIJUD8wl5DyRB8lxW+/iHE0nTP7Y9Uw/pL/Ufiz3Jh/fOTmgrnv/hUgAN5f5jGTj/D3+5TfxTQ4nMCBOqAN8niOjAaiZQWKbIxq0lua1joiieLmBZ4Zx+cyB51T3liaEdf3acTN1uy2cCOp+3MA3HFD/833/aJ+0vNhIUSUFRVqKaLrYXhjanwMtmK1V2IlcYAc7HoB0DfayoCUZ6ohLMOItnr94wdIkuQF3/uhoXhGl5jDNIXLTJ6YIwe/4ZClQCkt7MFjdv9Ked5IQ5yIXDt0JaFWGlEWrJW/GCY3X5jCzkuRHiyfVJO7w7zvOh71JTVoPRb/+mqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHRhSpzn6F/jLmAhZjj/PqCYJNweFpGycSDsBJh5y2A=;
 b=JNR7mtOdKyDriTnFZxqKcTISEy3LTOrG4XYHGZMpQaF6l06I2UKLWpngJ1KzeDlO1yJSWp281RabBfBvshKXbN1FSmipVqGvP2uuaWp96z32SkplyTCWZ86pfN+0HYofSYZwqIU4kjVKfmPk52UnpuhalFkohcb9cKTiw/KCDXH6DySc7//dE5tEDNzcsGscfWdnuxipuBcK9byY91EQjlgsfD3czOWvRdZzhPlFG23u4UI3kpIwANBxfZ7NTsvfox4QEn4Vgb38H9C8qlZ06Pue9ivxnhCmOqlP81JjcRL2elh39n4b0xL6Y3Bvd2PtgapAXteCctw9VcWSX2rDlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10265.eurprd04.prod.outlook.com (2603:10a6:800:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 27 Jul
 2026 16:16:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:16:51 +0000
Date: Mon, 27 Jul 2026 12:16:43 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: sashiko-bot@kernel.org, Frank.Li@kernel.org,
	alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v6 06/12] i3c: master: match I3C device through DT and
 ACPI
Message-ID: <ameEa97uD_lgN0iZ@lizhi-Precision-Tower-5810>
References: <20260721042558.925AA1F000E9@smtp.kernel.org>
 <20260727143928.177022-1-akhilrajeev@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20260727143928.177022-1-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH8PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10265:EE_
X-MS-Office365-Filtering-Correlation-Id: 067c4ee2-62d8-4095-9502-08deebfa7770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|1800799024|366016|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: V3UtGKOkq4bvq8xPDuY+WefRbw9bDUSlueyU8TLCzFNmqYWOimIxOT8kehgtyRPmTQbvZ+rFWNgUaNSfOTEkQs7nnSAHlDsnYow6VhHmhrSIAwR0MSZt5LWu0UA/lATD7GFPll09H/jSkoaI78zuNTjYkb5exeif7RRO994dC8Ef47HnNaNRYKCQqZh+yhmv9id++/jxgB/g9Uc6WAGxhbPFHf5FIyKvg3X4m99JpoDkTvYyBZZFgLbJqh3gfQ3ueFcrw7dliIRLI7x9GSVP/qsFGzS3cdXPC2WqQvyHmXWuTD2xm47M8DzDUHrYTMfUHAjpaH5R/NKHOUzP2sO64defYawfk18PO+1OfyHjfZ/CrDFoj0+2E+8hMrl1fE07k4gYLiGa76Ph+g6Nk1/p1d4aTHxqU0GwCTSyD/YZvrGOdgPAV+qk55lD9PLagBhSB2DKFrrlGWoBh1vyR+resSC0NmzhIVjiNx5hQQF4gXMBWPFoUrQPYwUp3PAt4t+jXwC3ZsoH2ZMuZkfzbdVEDz+5CrSqNBKX5+r5OJtMf3SSHD2V3lXXhdJYz648r9H8T4zFfDcOIAuIKAUfUdNsc+FxdKx1PRRnEIeaLre+ngzCI4Q6fSiAeO1VBlQqNDRaYRp1eVCG5nDcZ80FD7l5XgYrfjPkHflHTD/cD9uZH/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(1800799024)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6B7xixbGu5xGbcMQ4ig2GcuiEi1xbfZXPsxPY78ilGztPhlCdPVR9VG4orT?=
 =?us-ascii?Q?eIVxZwrBA7fzbvbg7hMEKpDhemIiCAoPrwuOxGW4LNUgfgn8Anq3ILeG9PF/?=
 =?us-ascii?Q?aodRUWX3XnoQu4qm01iR+f52+HuEClCQrxWGtj2sqjadTHybm40bjybyPaWV?=
 =?us-ascii?Q?odcvbrwLt8UXa0r45NTsfWitljZPj0IklOl5Pny1i3XTNsZRU8kreJ6EQbzB?=
 =?us-ascii?Q?lWvPWWBadU/EvnoS/A3scMBNpu/piqJFDzV29yTezdEsmS+sbZRWYeh76iRN?=
 =?us-ascii?Q?Tt9LP7RVJqcP7FStEJBADI4gFgKW8rN/gBWbDWlUPhhuho8qDhdrYImc+zDp?=
 =?us-ascii?Q?q7vaKQQOqM+Lv+fxypbm0v7H13S4XuablRbuCWLM7DyqBFZygt3vJpQ6sWhN?=
 =?us-ascii?Q?y0baI5A7SFwNnPzcRQIsswlzpRcGYI/dmYDLCzr0rk5Xuz6pJFQZVgW5wiRu?=
 =?us-ascii?Q?hdTOI5rmcj3fwsdAp/KWHBgPKax5yPcomhEqqrEybIhgfh9LSvuPnVugEUtg?=
 =?us-ascii?Q?w5jAult6Xj9Bo+a1+m0PegDcgVFP/n2D6UwNBi7GUnOib0Ui6FByJjwlYtn3?=
 =?us-ascii?Q?oYIAli4/uNS0xi15KyCWM8nyErQgDhR9jYyIsIs45JnjUPicrfx7QPmHvIlc?=
 =?us-ascii?Q?PuCtSPu9MKIGe4s8VdZaMNIwpPWXFpiQeXHyc4fRxieJBKJG5OxPHRqP4tzR?=
 =?us-ascii?Q?N3IJdtgsIbsBt/l6nri/Wqn9sD0jRe1ma6b4VwE5+nMfD6g38opOoBFY5obs?=
 =?us-ascii?Q?gcq9VcBJABkx5/KG5aDLpyYCqzF4BcmPKfTMENk7V8d7BDa4vj1Vr4Ve9Orz?=
 =?us-ascii?Q?R2AuAFjZOj4T45GoU3X7kaTLBwvQUplEnxIPmSk17YRET8ApvP2ytxYUm5q/?=
 =?us-ascii?Q?KRHX5v1tK2cG09sRhGYC6WQLl9izAYLgA6eoQMcZJ8Ef23m8WvrS9bM+iVl5?=
 =?us-ascii?Q?20107JmkHSuUiv8q8JTd6s2mcMtZMijE6yUbyEDIGpf/ezRiOZCp41fERKG9?=
 =?us-ascii?Q?p9FJHSK2dTGALKcLtOEDRW/Adt7+4G/CTWUL65s3fq08/wKPtkT/mXIyGX3q?=
 =?us-ascii?Q?EK25xtox3NsaBjCgj8bMn+oxe67iyd+GHviSg9K6hUameFho28EylestkF/3?=
 =?us-ascii?Q?UZ/vuui8eprvBuz2kuSFHv3sthsREI9VXpM1yBmpdCtz+i3QnyTd8xPEfJ3O?=
 =?us-ascii?Q?lgyUHB1Toq/sOc8aNAmqEZ4XlRKRfVKeh8cNu5ceIvcdsiDt1BEKN4XH2zme?=
 =?us-ascii?Q?YnnKpeQGqc4FHYbNskvVfNu9NeGOmWK3iKPweHq+ICSE3UVrR/hB+vRCLVyf?=
 =?us-ascii?Q?7AjvpFmUQAF6PUKWWsEaqu218GcPzWm6lEb6CopKZdqZXfYujzo/Y5viedBm?=
 =?us-ascii?Q?S97PPQfJg0UkTiLp1qdIVGjkRJgtcagJShzDn3gR5T6VvRupxUXEoTfTaTKT?=
 =?us-ascii?Q?JA0kd9HG1p0aq86Y3naatXuY6SB+skeYPdjDzbQDBXKMS7IrTcDjfrxF5/S8?=
 =?us-ascii?Q?7QVrjf2Df9yFa7ird1cT/Kj9PR5ze75CIHrlNgSTlaRuaiSsrIMrZGqPHqlS?=
 =?us-ascii?Q?1SMZFy1Rcops1tN4xKa70iSykFR5sNrcvQ1jL15dGfMG2K0ceSCGm3LLCK31?=
 =?us-ascii?Q?q/LY6qh6ZOy2qksDP3BdZfK/B5jItFGtnGOBcHDorC2+1Ne8EapO/FAchHjJ?=
 =?us-ascii?Q?7ZNGl0m94CkWV+EpIcAPo/TLWlL93/VzoNNRFY6WxHgqeswg4akbHBrmv0SV?=
 =?us-ascii?Q?64owubdStCKaSJ3Gk29Th9sW6kLywplc5Z4PAUAcv3lQMobXYLkR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067c4ee2-62d8-4095-9502-08deebfa7770
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:16:51.3247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzBdujpiwg7WkqfAWN4XbcUqnl8O7xq9H+bv9+wt5Z9Mtztiy1XtOT+KAVe0gdijNyKJlOnXrbw5oyYM8NTC44GLY1G6FNvgqUqEjsoRzlSoQmgu06tup2CFORjbkoY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_091655_993812_5D7A0272 
X-CRM114-Status: GOOD (  34.12  )
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

On Mon, Jul 27, 2026 at 02:39:28PM +0000, Akhil R wrote:
> On Tue, 21 Jul 2026 04:25:58 +0000, Sashiko AI review <sashiko-bot@kernel.org> wrote:
> > commit 7db2eb24719ceb614bd3ec6e5efb369d3b92fe6e
> > Author: Akhil R <akhilrajeev@nvidia.com>
> >
> > i3c: master: match I3C device through DT and ACPI
> >
> > SETAASA-based devices cannot always be identified by PID or DCR; the
> > standard I3C id_table matching may not be applicable. Allow such devices to
> > match through Device Tree or ACPI.
> >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 7b2f819bf4437..43bf530bc6619 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> >
> > [ ... ]
> >
> > > @@ -345,15 +346,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
> > >  {
> > >  	struct i3c_device *i3cdev;
> > >  	const struct i3c_driver *i3cdrv;
> > > +	u8 static_addr_method = 0;
> > >
> > >  	if (dev->type != &i3c_device_type)
> > >  		return 0;
> > >
> > >  	i3cdev = dev_to_i3cdev(dev);
> > >  	i3cdrv = drv_to_i3cdrv(drv);
> > > -	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
> > > +
> > > +	if (i3cdev->desc && i3cdev->desc->boardinfo)
> > > +		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
> >
> > [Severity: High]
> > Can i3cdev->desc be modified concurrently here?
> >
> > Looking at i3c_master_unregister_i3c_devs(), it locklessly sets
> > i3cdev->dev->desc = NULL during device unregistration.
> >
> > Since the check in i3c_device_match() is done without locks or READ_ONCE(),
> > could the compiler emit multiple loads for i3cdev->desc, leading to a NULL
> > pointer dereference when subsequently accessing boardinfo?
>
> i3c_device_match() already dereferences i3cdev->desc without a lock (e.g.
> via the existing i3c_device_match_id() path); this patch adds the DT/ACPI
> branch in the same context. Serializing desc against concurrent DAA /
> hot-join spans the whole function and its pre-existing callers, so this
> will have to be fixed separately.

Okay, we can fix later.

Frank
>
> > > +
> > > +	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
> > >  		return 1;
> > >
> > > +	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > > +		if (of_driver_match_device(dev, drv))
> > > +			return 1;
> > > +		if (acpi_driver_match_device(dev, drv))
> > > +			return 1;
> > > +	}
> >
> > [Severity: Medium]
> > Will this fallback matching break the assumptions in existing driver probe
> > functions?
> >
> > Currently, drivers typically call i3c_device_match_id() in their probe
> > routine and unconditionally dereference the returned pointer.
> >
> > When an I3C device binds via DT or ACPI through this new path,
> > i3c_device_match_id() will return NULL. If developers add an of_match_table
> > to existing drivers to support SETAASA devices, won't this cause an immediate
> > NULL pointer dereference during probe?
>
> The i3c_driver probe callback does not receive an i3c_device_id, so a
> driver that looks one up must handle its absence for firmware-matched
> devices. The spd5118 driver added in this series matches via
> of_match_table and does not rely on a class-table ID.
>
> > [Severity: High]
> > How does this change affect module autoloading for newly supported devices?
> >
> > While the patch allows devices to match via DT or ACPI, it appears the bus
> > uevent callback, i3c_device_uevent(), was not updated and only emits the
> > generic I3C modalias.
> >
> > Since of_device_uevent_modalias() or acpi_device_uevent_modalias() are not
> > called, won't the uevent lack the required of:N... string, preventing udev
> > from matching the device against the driver's MODULE_DEVICE_TABLE(of, ...)?
>
> This is a deliberate trade-off. Emitting the OF/ACPI modalias from the I3C
> uevent suppressed the native I3C modalias for standard devices (the
> regression raised on v5), so this patch keeps the native I3C modalias.
> Firmware-described devices are still matched via their firmware node
> (of_/acpi_driver_match_device), and probe/bind was verified on the target
> ACPI platform (SPD5118). If OF-modalias-based autoload also needs to be
> restored for such devices, it can be added without clobbering the native
> I3C modalias as a follow-up.
>
> > [Severity: High]
> > This is a pre-existing issue, but can the removal of an I3C device leak
> > uninitialized kernel stack memory to user-space?
> >
> > When an I3C device is removed, i3c_master_unregister_i3c_devs() sets
> > i3cdev->dev->desc = NULL before calling device_unregister(), which
> > triggers a KOBJ_REMOVE uevent.
> >
> > In i3c_device_uevent():
> >
> > 	struct i3c_device_info devinfo;
> >
> > 	if (i3cdev->desc)
> > 		devinfo = i3cdev->desc->info;
> >
> > Since i3cdev->desc is unconditionally NULL during removal, devinfo is left
> > uninitialized. The function then proceeds to construct the MODALIAS string
> > using devinfo:
> >
> > 	return add_uevent_var(env,
> > 			      "MODALIAS=i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
> > 			      devinfo.dcr, manuf, part, ext);
> >
> > Doesn't this deterministically embed uninitialized kernel stack data into the
> > uevent environment variables, exposing it to user-space programs like udev?
>
> Pre-existing (the desc == NULL case in i3c_device_uevent()); not introduced
> here. Better fixed separately.
>
> > > +
> > >  	return 0;
> > >  }
>
> Best Regards,
> Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
