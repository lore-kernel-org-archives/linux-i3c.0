Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA10BC55ABA
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2026 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwn90s+EHupQm35otCZee0ykhA+WLTkxarFlyvefkyk=; b=d0cwwZIuS4Z71M
	PVSjTYQBVaIk+YQ0KLRKkYGskbFbiSaLJTKGekIP+b0/+a3ZRMKARixhrzU6RKLnZNoBsauos+tFC
	FQQyGntgLt9vzVX8dyXqemfUHE3nJwKJQaqQ01jdk9q+2IaXTWhsACgAbHOpNDnlIRMb9WNO4LcMi
	VEpoFnAVHXfV8U7l1rOT/4vzV3oHs5IB3cz/BRzWXqE5Vi5uBOdwNyft0zmmOi22a73Y15NIudbJN
	RUa84EUC+OZIGCCPA99yjeEdgmbw7Cj3qJh4JSj+W7w+dIjUub4e8/75K1XqJmowKZgMSM6r+CUVY
	Frsw6jU5GgGGkkwwOh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgxV-00000004R56-28Mp;
	Wed, 05 Aug 2026 19:07:21 +0000
Received: from mail-francecentralazon11013028.outbound.protection.outlook.com ([40.107.162.28] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgxS-00000004R46-12ah
	for linux-i3c@lists.infradead.org;
	Wed, 05 Aug 2026 19:07:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXMW6XG/eHoteFsbfnzZzBMDFAIHr4CuxyhfY/0OwDo9o+NkJf9f7oiel98MDdv0tRGmoyyErLXaixa1dCRsnS5+7M9ODImaCqqtGYyVHcKhzky66XnKFI0k0lanzONCAfwHNQvBDiXrXgZFLrSJ/9R1QZrUBkdsvEqZlqUWjpmmEjNH+DznbmHthcdI/WFghoyuxTFtF5hmlmYy0jg+LBO+u0YA8PI0/hCR/NZz2wLSLJ5YqzDYNzdX78bo4kw+QWLZ+fqxIwvvB6rgxzuq1Zf6azjVN2uU6p2W7zkKuCL1xE+tYI0HHnEILH9k8DoLst9q5vlWMqpB2ct7CBqxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QumcG1ztB1jam4K/K36FUqw+26CMkW9Dal3Su8pSscs=;
 b=vtj8YDb/PmgPxIUE8O5Un5XjITAc/GZ+Oe5uiMu/Ot10Y6D2tBBYB/fOQBxsvkdqQP7ZCOhNnpqfPw69V2RIYmnVKwF7scd7KBmAMQzMuyvCXdeb4ZFQxOXbqtgpX3HZOqtn8fgEWaEMYO9JTaSwaPZW7Cypoo7ZHhM1C8/h4L00Bocp/GUF6yZ/zNQ0AqpcfzcRKNDop8Wyh1sr7yLXWrS+h7Nd1RA80oK7grnh1DU9vlZ+wa9EdBat4Ei31+z5fxLaYTjwQM6c6w9dIsgFtvwFI/Js2ce1CCUSJk+7G7Z8Sv5sQanEG7GNpPTfRoXyqaEUme5/QWjXhnfjFHzpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QumcG1ztB1jam4K/K36FUqw+26CMkW9Dal3Su8pSscs=;
 b=ubQLltq2buWhMjg4I/PV+L8/t2MaIiQ3gQjWTpQR3ZZyl7+MaP8qtF56JntQ8scYOyp+5xoaiugP0SDe4d/lOC5hcqq9+Rv7ZmHDZpHUTZ0Hlw9lN1RszR5nvVBeplL3yNu4JYlZYBablOWxfbboTNhNX5/ZtlmxsL6RuZ7uxVPrpAS9KnzXYhbatKB219+hroHlEoGdP7IqUYEO0sZ+LJBlMbzwJTB5mjZmNAIJfeAUcfxlHDOMHUHMe2P7Ju2gesyrS9439Wd5X4sNjDyqnjRURUIVP0iYbiVIxb6S9ojvoJFW8EIgzIS4hVdXYMbaMzqiQM8oWe5g83r1tx2W/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7667.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 19:07:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 19:07:13 +0000
Date: Wed, 5 Aug 2026 15:07:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/5] i3c: master: Release the fwnode of i2c boardinfo
Message-ID: <anOJ2V4_R0KFM_aQ@lizhi-Precision-Tower-5810>
References: <20260804101301.2975911-1-akhilrajeev@nvidia.com>
 <20260804101301.2975911-2-akhilrajeev@nvidia.com>
 <20260804103306.A89B81F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260804103306.A89B81F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH0PR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:510:4::16) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: d54c6344-546c-4e88-c74f-08def324c160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gf/sMSzqplf+RkQ53jiOLt2bF0pD94gQL0GpMKNbRcoMB699Hpy7AQNywO3wRJq9la6+BrbRax6axMi+mHQMqXSGmcTcpwNi44vlf1MGFG3bpFHPpEtIfajvpdzWzLKCZj/Dfl7wc3fPc/npBSn1eeGmdOKi0P56tYDIFIjcQDcGeMeMz8IPGVxwdd52pjCtfead/7Z6hkQcCtuhroQHM9udFuG73ZG+a6WvIko46UW+wtrEA+yQZAuPhyA7rEIJGhmPP1oTFTiUoqz6pa587+UT+QOtUdZnfAWwUtY+a5tbFSV9BzA66OEmRbN/7nnIOgKppEd2B3i/10xPkvy/jvQ5YpTeAHvq6/I/nXYV1zTkr4pqEOqOeGv9s2sRvcUR5u9noJZjLW9W824sFGXM5QNHPUVPNd792MsV+3nJjXjd6UgT2Osav++z4c78JYVv8f38a6rlwdMt1xi3PtAerfwRPp5uW03j/V8zPiG0hLVS/vB/ZiiBdAKhi5QKCDUcPFk3rvdc/J5GOV0F2LS+qcP0TT2vvuNHe3Csrw4TlY8bZLHZ7K7jEb3sohfDtqppBx97a62jtK3vE7nPIWbyU4RRjhFRF8q3d2ja0nsHQKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qVWuoSkmisfqIeR177MH8UsF9uvGMYn+Ddyfq0HzFoM88FL0YuEJmWNKW+?=
 =?iso-8859-1?Q?v/y24Oo6cYLxXVqgwDXS+dlBVmzxrNQ66ZW5FzdtkQ+qnPrE/CS/XDuX2m?=
 =?iso-8859-1?Q?yZ/g1Zh4RfgG194Zci4Imf/iFHtGVeSUlBUzLcarRr19Vcyb6/xVo+Jcof?=
 =?iso-8859-1?Q?/P09m6h+KD6+hZtBKS9KGx1uO+vzbaIlxOhW6Xm9ZxXhDveSHepfb6ZnUF?=
 =?iso-8859-1?Q?3CfI47+u33TqdDqjke0KFTnwPFUBFAFR4t0/LbDIFFUcrNuiAq3KOOfGip?=
 =?iso-8859-1?Q?mIh1anfnuTYCD6UlW1Swo+5MIX5DCOo9Cyu2Wuok0l/ddnrliLOp6ZMX9X?=
 =?iso-8859-1?Q?g8FRyCGqImXbp3utS0w22VebCYQRT7vMa69mvFzcAkozT57A77m479j0xg?=
 =?iso-8859-1?Q?RqQO1F+TcIv1qYNUy/reiKwoBDG3N+nMAUDgkwn8oOvnMELX4fg8Xaat8+?=
 =?iso-8859-1?Q?FFrMoretOUtj7ss+ZToWYLZ9wxeTCg96eudz5tbhcRxwfM+iFx+G0eflYV?=
 =?iso-8859-1?Q?y2OIucoN+vlj6N8I5DrckznhUBw2rWNv0KqraBxQEcKSFXJvv9bPAAxs8F?=
 =?iso-8859-1?Q?VQghKEtmR+fjjdRaVDGXrciGR2D0NQKgk0rvCZwrRP9zGVuRv0bxQ1IMs3?=
 =?iso-8859-1?Q?wLSmA8ioWLmVkF9G/DTtb2JTz9sT0LaHWNVr9sOxN8x1yTsM41cqhlXlAl?=
 =?iso-8859-1?Q?gCY9cFrwr+QPgIZRGiM5HNO5PcAc0kfk2R5lo6L3W6Rst6jJ6cK71Sir3P?=
 =?iso-8859-1?Q?cAYWS6dpuaQSNriMGumBsPQqqF88/Ch2lbL2avsNinpAgNePtE6DhTxGtv?=
 =?iso-8859-1?Q?TQoRF2lkL2nUlwJiThrl5myuwGNfzztdd9sM0sf/FOstGALORVRPooLopd?=
 =?iso-8859-1?Q?Pw13zxJYgwlA9Dq/ESPdQ1Nk2S4q6r3K6JIqvqT+tmV45UInEcMgS+nhWd?=
 =?iso-8859-1?Q?ai2hnAwImyAZXvC4glCXZPuMVYNCPDN9yzCLom3lB1CgO1XtreAaHRiNmZ?=
 =?iso-8859-1?Q?pj1+9jbh8YYJMEhJbIZFBeS0eG9to/nTJ5leJNeJgMY52gbRTqjKQaRaR+?=
 =?iso-8859-1?Q?gT6VjJu8/gBrKlYmWthNCL6OV69IoUPBznyKKsRyVrfeEzcYuKPU2V35ll?=
 =?iso-8859-1?Q?2ymrMgHoC3PzIfdnjyEdLQSLCpRHusFmwQW9p9roOJtZgJSy3+1twtgdtF?=
 =?iso-8859-1?Q?6D7GvdBYTA+TjYUzgswTiDThrHPcsuWzh+CeGsDHhcpVrJwYB69Ged429D?=
 =?iso-8859-1?Q?mrbLXH10giH9NdpA5eryYQV501l5wc8BzxOE33ZUIQ8IU2wXk6k1NkpPcG?=
 =?iso-8859-1?Q?gaRgj+Pz5NClsGouBNimmx4PU1nNgL5zJUe/8dkJou22eumSMuCE2JXnGg?=
 =?iso-8859-1?Q?OF7EkDzc/yF+IN4f8cvDGS2xwmrXcPg3bPH5TgzNXahhBWRoAsq4CF45hq?=
 =?iso-8859-1?Q?yeIsRF9NkxtbzcURhy0+nLKWBoPHfg1IB78hlr1b+okhHpbQhlklFHHeK3?=
 =?iso-8859-1?Q?96B1ZwdSTMNCAlu56DtwBul+N1tv3DwQKm7vrqA4frYKjnhyDDiCx7jklT?=
 =?iso-8859-1?Q?rzyCdsj7iwi8nq/iCOE4S8HRkkuE0leySkEJLgpXZDC0IjM2LzvNTvnMtE?=
 =?iso-8859-1?Q?aJAd8PlKwnJiFSfcf1Gq1jZ2VCqqBqcT/4tHYIpojeUXtbOnUorkLM+XkS?=
 =?iso-8859-1?Q?Fm5BDXQo7h53ZIDzidgboTb130i7QmgVC3Muxur3/l6g20BIydiJySYTRd?=
 =?iso-8859-1?Q?rmLhopQ/ojiFM3XiLrR5GGP7MyzvyILVErzWNU4kJ4WKI7euDftPn43AbJ?=
 =?iso-8859-1?Q?Y+aTYcj0W2Ej5rn3nZXf2lhZ+meK0YudsoZmo8wXwnH0dv/hscnO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54c6344-546c-4e88-c74f-08def324c160
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 19:07:12.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31Y3XstfIJfQfQ+JV+JO1SeXbF8wDitGAUPt2X4rsUv2EeQvuwbgxOyip1CVJFhzTHutejv0Xx0VgveffeUDoFL7MmT4jRbK4V9loqvrnWwJ+FxsB+55Zr4K9J5Q6gvs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120718_292381_F86CF57A 
X-CRM114-Status: GOOD (  22.89  )
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

On Tue, Aug 04, 2026 at 10:33:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The patch fixes a fwnode reference leak in `i3c_master_add_i2c_b=
oardinfo()` but completely misses the identical leak in `i3c_master_add_i3c=
_boardinfo()`. Furthermore, there is a structural lifecycle flaw: `i3c_mast=
er_register_new_i3c_devs()` assigns the boardinfo's fwnode to the new I3C d=
evice without taking a reference, and `i3c_device_release()` unconditionall=
y drops it. This means if one merely blindly copies the devm fix to `i3c_ma=
ster_add_i3c_boardinfo()`, it would trigger a double-put UAF for instantiat=
ed devices. To fix the subsystem fully, both the devm action must be added =
and a `fwnode_handle_get()` must be taken in `i3c_master_register_new_i3c_d=
evs()`.
> --
>
> --- Patch [1]: [PATCH 1/5] i3c: master: Release the fwnode of i2c boardin=
fo ---
> commit 9b7e7e5dd15b80d230fc0e52c4d7b8ef9dea16c9
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Release the fwnode of i2c boardinfo
>
> This commit fixes a fwnode reference leak in i3c_master_add_i2c_boardinfo=
().
> It adds a devm action to automatically drop the firmware node reference t=
aken
> for every I2C child device when the controller device is unbound.
>
> Closes: https://lore.kernel.org/all/97465893-3650-4f37-98b7-1db76fc6fd03@=
intel.com/
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index f485b98805cf6..08dc10f172aab 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -2913,7 +2918,8 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_co=
ntroller *master,
> >  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
> >  	fwnode_handle_get(fwnode);
> >
> > -	return 0;
> > +	return devm_add_action_or_reset(dev, i3c_master_put_boardinfo_fwnode,
> > +					fwnode);
> >  }
>
> [Severity: High]
> This is a pre-existing issue, but while fixing the leak for I2C devices, =
it
> looks like the identical leak was left behind in the I3C counterpart,
> i3c_master_add_i3c_boardinfo().
>
> However, would applying the same devm_add_action_or_reset() fix there
> trigger a double-put use-after-free for instantiated I3C devices?
>
> Looking at how the I3C devices are created, i3c_master_register_new_i3c_d=
evs()
> assigns the boardinfo fwnode to the new device without taking an addition=
al
> reference:
>
> drivers/i3c/master.c:i3c_master_register_new_i3c_devs() {
>     ...
>     device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
>     ...
> }
>
> And when the device is unregistered, i3c_device_release() unconditionally
> drops it:
>
> drivers/i3c/master.c:i3c_device_release() {
>     ...
>     fwnode_handle_put(dev->fwnode);
>     ...
> }
>
> If a devm action is added to i3c_master_add_i3c_boardinfo() to drop the
> reference on teardown, wouldn't we also need to add a fwnode_handle_get()
> in i3c_master_register_new_i3c_devs() to ensure i3c_device_release()
> doesn't consume the reference the devm action expects to drop?

Make sense, please make i2c/i3c handle fwnode consisent.

Frank

>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260804101301.29759=
11-1-akhilrajeev@nvidia.com?part=3D1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
