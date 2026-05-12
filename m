Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C441CD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEbASVIU6V8nurFAxLDRdBVx1mqPEl56EG5/GqUHTL8=; b=cklWMV0cuyiZL8
	H+0VkfaXEFIhE1z71D+WYkAgJ/nDlhFMW8NjUboYyZYdCdUv7k37Au/C/3WeaFsH9FI+2ihac0+ai
	iQZfNC0NTEnV4+t01SGDzpAK5shE2XQ1wWvonqOpTUckAL5YIY7QukIbXgsGyum68lPLghVyHT+ug
	Q7QoaWeqhp5bjWPbc/ryJA4UyJtcnT/E3GIQnlF7clq5VZz3PhuLAtYIiSKwP4smVsWdgkCrvbWoA
	vOiI9/QhpLDvAC38gIk+2pgd2MGyLbI+tMzt4/fpAVeYzR4VHGbzPD5pKoS9djzpnDi70CiqWehGy
	nfHRB01BxWnHed25LAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpmR-0000000HKUc-46c6;
	Tue, 12 May 2026 16:16:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpmR-0000000HKUI-1X17
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kAPLKuzILPgnapo0F0KEwJ2tOYk7at95j8qcLk1iSjE=; b=MPTE9fMGY8wWzR3rc2vandHDP1
	w5tJVujYo1rJSw44raEL5wkW/9/ipSeForNvP0si1rRa0cZl7pBibDJ4wQMc2ocmTnn697PKhfA+L
	zTiVsXcwKEJmelWTfFvJWOopGK/urYE+h3nH+B04L09O/XvH/z+NNyDdLG7klgBcvMsSg5xJ5n53C
	c6Y5/JfP28Zy/jodzxkYd8CYdyEt2kag7poxI9xV8Ivi36D5A/zNd5vbzXreGHQPZdoGuMD5cDa5n
	2M6laNcPNno6zHTDu20rxxUx6u8YHf3pHK5hW+F+DUyElcyDgkcuie+kj3/BmUPG5JpHc7q1C7Bgn
	NM29zHTA==;
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpmN-0000000FI4g-1ty9
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:16:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq0wPMQ4A4f3DLPwEFjAOqvSg6QRJCeJGvQiFZRJ6AGY0LlAWhqBElyn6MUZrmXlQBXhLj9FDqDg//G3Y4smt6kYBnywf9WAZmWEnLq7bXEpKwsXohCNco1+fFTYhC+WUzBJ9jZNhCt4GPqNQ0D9c1BaeYm/oZfSsPgrWgbjUp7yvJsuSK9cHxSgWrQ8BBRW05YauhVyHZOVFdbe21D9B/akY9/Hb/s9tlwW3//kTUkTBza0809tMl93Htw0pvWa5PvFWTkX7LHnw9CdVea8oqKM5DnyKa0QZUXSndzq5tKxBJG6x09PgTmNVryxfcXMqJFu+xOh7YVZpek1ERTZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAPLKuzILPgnapo0F0KEwJ2tOYk7at95j8qcLk1iSjE=;
 b=eEKVHcF7jYU+CoL76xJtQnsYeUisVYhW1jkotDg7zXY0yWcRxSn999/KUAL3T1ByupvpAU9BG0MQBeIu/d/8o4k7VCtMIgVCNIkCac8ya7IMyBBuulxqisArNE8ZPHzAN+jUFBK+R61EwQVUl7S9cYCYgEnKZ08bqCEyMuRbL5Qae4Hr5aoC1ZRaZWi1qT6k/J+iKbge/BNRoOY4SQMPGdPpW8DS6BiRZJ67kpFf6O/3IPQA4DRjcQBrG66vNp2JUPFenVcxqXcCiiFLmp5G9p65GH88IbAventABwrl8WMd2WrbVzFUL3POOazOtbZjSVYk4IaA12g4FvGDCTCMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAPLKuzILPgnapo0F0KEwJ2tOYk7at95j8qcLk1iSjE=;
 b=bBQUW9H4vsfWIF/2Pm7CeY/9qfZPlE8zSqQR2nRrTrWSIR4GB7cGSxQvhq3afMLBZU4SiD+2t3+J4QUAB/clVzBXw6Xt5eEw1AFLGIZQSYY1evzIN9fx8Nt2ZHm3GrEMcyAC6V7QyRZr9NR3OXFqHvYdYJK1/yOqAEbErtloGQdbK5mX4vn8fPYRpLA3i/IAERaF9x2Gdna7HnouBiSt+jF2lP2eqGE6NpdbDgpVdmM141DuuY7dBhyRHYxYHRJVraiEQuijkbgwzHB/y5pXWOWURBKPqlSKEA1nEeCLCcRty4/hwARqoUTN1SYInfUPRjSzb72A8/ZML/W7Jyy3PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11813.eurprd04.prod.outlook.com (2603:10a6:10:624::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:16:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:16:13 +0000
Date: Tue, 12 May 2026 12:16:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] i3c: master: Consolidate Hot-Join DAA work in the
 core
Message-ID: <agNSSNaIf5GI_yoP@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-4-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:806:127::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11813:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c16e214-d54c-4744-f14d-08deb041c97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +3RMdf2jeR70pnJh8vvLaMAoYwsgiZWe1WB7qNT1Ha0ndvpGcGWMzfheIvyiTYTESr+WUP10/C4+g8G/U4Tg21elJJacAaGK62Yk76EBWl4547x61Qzwruy0lS25KXiaIj6geoK/3vi43fpD6vcUptiPm6ECJo4Yj/H+PSPjbvgcJG22QHTrdxlDfyy0FlRRB7ZznVz6UogFLC1q1X7+aFp/yc9w2+emeGNMI6UIERD7d1FTIqBZCCQcFZn+QZKiA2IAkRrlyb9K5O8KNHMqj4yiXS0D3VZzPa+ayU4ZQU8bcEM/z6LSyW1BSKQF9fdM1UaZFq/bFCMjJqFrI5AxU1GZjZdkSiw9lp1a3FZ9ps73Tdau7ILhG+36ckY4DnHjGzw48ofcnu3S2qtl4+HVC1fsFrCzt05mYHO8oyYWFJBKoDCb2AtT1ihkkhYP0gHGO/GWrTpCdvvgO6pARIYY8YPY/s4HMfLPv7UTutV8ARj8OG5TmpYyu5K/htkjZsasZnHsO5ZpyhyJgVO2RqhhAycM3bFHJgVlw8koC8A/AxtkM2erHhhG4f7msu0q2Ke2pBvNJyaS53uJkvLY0SJf+SsXtFXhiA98qnO7jS0HnTQby7J0JWIqzOIVxglV/aepCX4RsJlpJ/tur3vmZQ3NhF4ewsYy9jtq9pv8epopWYO8Alh4REW8YkfdwQ5yWykhCN/PExnjL03uYBLqZ1FQ96gxsPybZmUpOBbRU2y8taFy7u5OCYdomL37qF1P4WR1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HmLHyEIVrHhTcYEmyTbkg0BQ/7JFSAXcY1Ami3OVMC23CGEt5wF7F3cqvLlJ?=
 =?us-ascii?Q?GBofYH6hzdENh1JW1X6xUzcklzovhxY66ECtgvY0awdBmyYaHr4qKeN/H1R1?=
 =?us-ascii?Q?9c2y9HXxh8ibxhSl2KOEWvZqj0Ih4bR8dwlGK4USQd1o98qjvpCERNdycPxe?=
 =?us-ascii?Q?7x9w6Plr2aMcu2ZXwokqrwgz6N/z9QYP9CGdoDl9yHBsWfeUpFuALPClVGza?=
 =?us-ascii?Q?53TBjIwBdz/QklUnTLXbKpjpk2Vfwrr92TffSygem1yMxTlGe20Zvi77Hbk6?=
 =?us-ascii?Q?R6CayxbGUFO03+Wae/BdMxprs2viiZHg0udoYp0uMHtkKZdD9bmtcCJtpFEi?=
 =?us-ascii?Q?g0saP3YTCjUaEsdPALA92KEvtcgXcwjxMWkkVwGy8hwdmuNlZhXrh3SixDQJ?=
 =?us-ascii?Q?qqwuYg67yF8jHRixKXXLWBfHNW2Os698hBPCkEfisEWeYYj7/OAv73r4pk41?=
 =?us-ascii?Q?jMRgFOYRnPzg6U3estSDIvlnG0VdbTbhRPBD3rhDwiBW/jfX1k/XfS/8ObNP?=
 =?us-ascii?Q?/fklW+/TSqAkj2Nvx7g3lLIbatDgIvFwFKaXG7DIC81VmJzR5O+RQIhVDLfo?=
 =?us-ascii?Q?0PyUJhyDsOVm7UWjPS89giVT/KIYl6nGf7IrGuwJPJF292SpvPLLM2pQcskE?=
 =?us-ascii?Q?/G6WByZ/C5JH4GHtzDFh7PVOTwaljieXPn/333q8LS3CiNYTu/t7VCWG5ReB?=
 =?us-ascii?Q?u5fLwX/K66aAEqNcrszTW/8Se4Xt9PWAh4Z3bsG9fBj+NqFt5el43yi5tlLG?=
 =?us-ascii?Q?/sBGHbY9Ra5peBvZcmhxC8STADAZrjWRUbXeMLtkpKivKkI9OOTd0LEI293A?=
 =?us-ascii?Q?CCX6gT6QgKez3tCRm6Si5MkiGIc7XmyYbNh6H8WdbZEfs/2cuTj+m8YuRLHK?=
 =?us-ascii?Q?v9M0aLO0c/1ey2eVPRGV7EU0hngxs+URJcd0/XIZUN2vJlkCLC2JNqMjZ0Oq?=
 =?us-ascii?Q?Grywggc1othVADBXjJnt1e5bYPvTXzYiAUHyOo5iM2gA5W5md0vqCwnEQOLg?=
 =?us-ascii?Q?h27tR+a581kDob4mwXDRPyGaExq/sWpeih4ZCm0B2RiAgigk5APTmLec76H7?=
 =?us-ascii?Q?X3uAhvRFhy2mIqYj1ky3vckgUDlxtGnEKU7FPYzmPDpH+fYDT5HEG2JqnSDv?=
 =?us-ascii?Q?977cagaNzDl84oVscf4MUEsSYCcwZd10R0Uxgmbu5rvEY+EsiuWHXCvI6exZ?=
 =?us-ascii?Q?HAZVgcTfEBMcIL1bHTAOK2KInCsN9nWm541vUTLpjQxPcE/oI1fJdJfI2Syj?=
 =?us-ascii?Q?n+KcP9DfuEqeAhBgn76zBYIg/HWoGnYFshV7MzaJgz63iRi6OBmCbHvQbJcm?=
 =?us-ascii?Q?63s+kb018fZpOqk5YE9N6PaQ92eEtQUqhP+HjgE07A2h8pnUJ/zUFuZXP66P?=
 =?us-ascii?Q?RKquSS3ZgZtEuW95tZjZrvx7VhtoXkfDoTm0cWMKDHEJdVB+51lMupltJk5N?=
 =?us-ascii?Q?cmNKfVHo75xb5NqcZRCrVK0u5VSd/JSmqXnbYK/bndCZXb9uE7A7JbXMKG+5?=
 =?us-ascii?Q?2C74yqqjaRyR8LGDYX+HD4aygN9PNCipFRgBAgQI4zL3xBl3kEJnXzkFwO5J?=
 =?us-ascii?Q?9HSwvHsjtj8XLfPCzBQIgxcC9jsFpLUkgJZbI6krfTmWikrBs0umAoWLlk+s?=
 =?us-ascii?Q?9rVurLe1UMzdhvP8n9o7cMBgxlOjg2MumiZPucjHoFDlH9sKWmtSuCh/OFT6?=
 =?us-ascii?Q?BfCZJTrVjMRozHtpQhL/oPI18J1oMtgtbeTL7bAAA2kvDF/v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c16e214-d54c-4744-f14d-08deb041c97b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:16:13.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJSpiXe0IoFcaJlbpTEqFFdiVjfrKWsA1uAYrWpNGNJE9+tpmcCtDcwAbHUgKzK+OSvv/fZAXToRzfLyylhoIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_171619_862969_5086E5D5 
X-CRM114-Status: GOOD (  17.35  )
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

On Tue, May 12, 2026 at 03:17:27PM +0300, Adrian Hunter wrote:
> Three master drivers (dw-i3c-master, i3c-master-cdns, svc-i3c-master)
> each carry an essentially identical Hot-Join handler: a struct
> work_struct embedded in their private state, a work function that just
> calls i3c_master_do_daa() on the embedded i3c_master_controller, plus
> matching INIT_WORK()/cancel_work_sync() boilerplate in probe/remove (and
> shutdown for dw-i3c). The IBI/ISR paths then queue that work onto
> master->wq, which already lives in the core.
>
> Move this pattern into the I3C core:
>
>  - Add struct work_struct hj_work to struct i3c_master_controller and
>    initialise it in i3c_master_register() with a core-provided handler
>    i3c_master_hj_work_fn() that performs i3c_master_do_daa().
>  - Cancel the work in i3c_master_unregister() so all controllers get
>    correct teardown ordering against the workqueue for free.
>  - Export i3c_master_queue_hotjoin() as the single entry point drivers
>    call from their Hot-Join IBI handler.
>
> Convert the three existing users to the new API: drop their private
> hj_work fields, work functions, INIT_WORK() and cancel_work_sync()
> calls, and replace the queue_work(master->wq, &drv->hj_work) call sites
> with i3c_master_queue_hotjoin(&drv->base). The dw-i3c shutdown path
> still needs to flush pending Hot-Join work before tearing down the
> hardware, so it is updated to cancel master->base.hj_work directly.
>
> No functional change intended: the work is still queued on the same
> master->wq, runs the same i3c_master_do_daa(), and is cancelled at
> controller teardown.  Future Hot-Join improvements now only need to
> be made in one place.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Thank you for do such consolidate work.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
