Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A808AC43458
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jul 2026 19:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Odtxuenaf048PGp33LGldLaI+w/b5Mq03WewvTSm3Ow=; b=oGSk58J82THedA
	f/1b68vDaaEmX+otq0vj6MIXXVxxgSXrQpV0lBYtcrpWNrCnc6T9JJ/Cy+V29/I/zEZ4HPev/ZhJX
	nNM1abNyhmQwXCwWYbuROD6zY+NB8/ABIsbhdHDhYvTwVxt72T2NS5uJdUuUr60a9xQTBLvysfH+O
	2nr/fjfhgG3IP7D640U1chylcRrnasI/eifVNqLvulQevws8lpMlIM8PeOpCaaJHgtqFxiLd9B/rI
	UemUgAgd1jOqSPMjgD1ndpc5kH6SzaCH9yi9P2wEcRZnktyheAnA2WvFtaIm4XbjkZA7nhtkU8qOJ
	qB7SMP4kzQydYmlIAAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMuM-00000005LuH-1rZ5;
	Thu, 02 Jul 2026 19:17:10 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMuJ-00000005Ltm-48Se
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jul 2026 19:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnYkZDNVhrwJSkgFCZPKetXQ2d28bZlBEvANttKKBBLIhY13zKXnPDiJGUQhoN/4IeOtT7d+n4spiN01Zgvqy7ogZ+EPXuBacXkn2qbbuGkWNFyj6Z7T0EAFr5DTxMtX/Txcq6wYwct81Mugu5XD9/JgVL2pwuxXxvmzwIvrVrAfp4MtPqjvl9V6mgkTep/PRP7ylTUwuOuiMYJz51/Wf5F3FVXz3iVoLBaIrPcf/KLp5LPBsUiM2o5CboGKKfJMX6vjilGmQei/viNbltG0NK7XEWJZ8/2cuW1FsxZgY71uHSKVjqH5F6y760kQAnQmFCZT5C/n3/0/CQoYBFjq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uX3wpe1hqjbiPy1RjJlbguU/3trVcDkhWj0hzYc2s8=;
 b=TNj9bBYsbjU8MphSr0eV1W8DmJjxU9x645O6YcKcsQiwiv7ptwI1rXsi8PVOSMgsR2WlOFBhaGdquottHCgmBLR22fM0UnwwId0r9hvGGGHoRpuC+BYiibN0an5Mbo2QOrrUpgsfoqH1L27015uowQPXMYiVEYcmywyrog81ZEBtjeNo4r8RaQqniYGUialeHEfxHkVKp80ipB08QLByZBcVJ4fBo0fu6iyfpYklSgXF1k7/Kv6Y02cagSp6gIUGf+yecvS37CrAdi3X0GqChNQrdDNdOEw9ZxAyBGn0j7jbLoxjbrOEj1OP6nmlM1BYWBcjl5BOWpxfd40C8Z8CQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uX3wpe1hqjbiPy1RjJlbguU/3trVcDkhWj0hzYc2s8=;
 b=Eyu4wg2vJW/4M83ni+hmwokczsaSDEVP165G4PLSMM+omLd+PMnwEfqeyeobEraR6iuxI6ImUjV/C/4UkGEhs8Mf7n61m8r6RvSNNdzFG9dYld49lunMKeU0h/WWQtMegIhOXfwRpim8lI0ENxZtLubqd2D6nOi7adKMMYtNsvfct1MePahaCCIeUB2OoVbVY7NSts7cpfngNsV/J3nuVHKHXBqe131XWvyDiIyLgBD7Yj51jhuDND5JnqW8cEOlyjQHOBkv8bDZQeUoswvdBLDX/ZqbcWVCtcSynXFRlgrNah2SBy03ywieBTupBPG2Cu1mRsljxZ4YXdp8srQT8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB10013.eurprd04.prod.outlook.com (2603:10a6:10:4d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:17:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 19:17:02 +0000
Date: Thu, 2 Jul 2026 15:16:56 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Fix device_register() error path
Message-ID: <aka5KN0oMdStzNhI@lizhi-Precision-Tower-5810>
References: <20260702183644.60827-1-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260702183644.60827-1-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB10013:EE_
X-MS-Office365-Filtering-Correlation-Id: 38139a0a-8b8c-4047-0216-08ded86e7eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: zwn1pRkA6iNHXWg97dcTqFcVNO1sW5hZLCkUgOV56ELYG9t9W8nfZ/rwv+C9Cxq01/igHfeQ2TbJWkegmDIuQILKsmoZ/EJx6gj4pIU3H3cpSDOA1JuYsgXBpxQWTsIpHT64diJvNvaAJL2/SXk9loFk9vD1JX3LHj71W0TqmJt1Hk5Z6L+ylVl5iU4Ao8TtC14AeL/evK4Vx5FljyXkDG4c1iz6RroOXjEpnORzit6PCAiQ+N80fwRg0fM9JkEhfLVjArZDN7vuyJt8pcqZF3id4bp3OZAfS5IRRCeSddM+wPwZ+x5sT88KyoAl8q2lEcsOs/n1bz3CwRGovSPAYueKDW74kp+1lFKlk7wo9FVRaW9iTyRNZKQfPnZxOaRyhuEvQL1WOwDdlcHLDod4hUaIB8MxMga+GUAF/fS/Bj5RQpTrRf5Z+RdPU6jn1pv11M8q5CGGAoLW/YzkpAW1P8Xg7MRYwwTS9rwn62mbWIB7X31jTT1jzV+BxiVfa1tnNTTJv5daqHN+bNd7HMnWdJZyfclm+AyFVxvc4Ll/swQZOoJPboO7pXdodnyexo8OwQErnTQvXhFMW60wOupaNGapnaKvVgjas04PWLPgSpoyfyUQ9XH0OeZ7FrKEliO/zuVqONp6gqklCONpo9B31uDCR2W1FrTqFgSAYRLDr9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2CwIm2BmMy2sNthQV1vB7mFs+f/HVcPVBxZl5kHuyPYt1epV50vY1yGuyi1T?=
 =?us-ascii?Q?2+vgdMjhYXpQHQYnfGLTWIYzgdDPXaXiXKK6g9LpiSnd+sBknuDOnAvWsMao?=
 =?us-ascii?Q?85XIUuCeoSFxEID7a5yQPI02RvQNYAzvD/RRIENACqWnBIueRwNJKEYHisr8?=
 =?us-ascii?Q?5yYNHUoXl41P1paeoEpz7Z08HOovoyGSSlFViZ/2TATWqvapfVypj24G+Kuz?=
 =?us-ascii?Q?u52d/TmoN1s3dt4fVt6HDI2YRLQsD6sFhv/LD6vjEE7YTgJW11w/3KHfj/Uz?=
 =?us-ascii?Q?fwB56S0PV1jr1qAm9M16fQpExQNGr5Zkixod3r4MWJ52IDEZ4QCkU2pBMO1r?=
 =?us-ascii?Q?BCuzwPZfb8W+esSLJQd0nPs+49DkTtazn4099bFGyZuJFxbGOkNpBUEUeL0/?=
 =?us-ascii?Q?KWXRv1cFw1qxiNZU1Dkpbmg8tF8EmjzjnuOJce63wEw+tskthoXamJzQU0ar?=
 =?us-ascii?Q?hk0gcWWgUZEAcUsmP8K2J+0HOBHWt/UbJQyfGqZIs7EIWMyNu8RxEc0KG9Zq?=
 =?us-ascii?Q?0bKLtgWAk2D2E74Lts8gGUlvSVtrG64S1QDv6RbRVCyx9b1CYutvW/9JpzdA?=
 =?us-ascii?Q?L1vut60JtKSnV5oav6CXIyIT6cwUFrXNBiaUe9uR1rv36NdR+YKGXDzN1b0F?=
 =?us-ascii?Q?tE1qblarnS/68qie5cjTozy6BoJ4di1xdkB9bYwD2cQ7YuCsjlG42FfinrKD?=
 =?us-ascii?Q?6MCifbR7fR70CsUFw1oaW4BbuHf52ImZWtDLwY8EAcGl0edwdObTx1aHSpsZ?=
 =?us-ascii?Q?r0iDRftpQj1EtOkEkVxGt3qKyNBJqatG7Op2rPvLPMyLpTMG4KYl4KzF32zl?=
 =?us-ascii?Q?AgQMpoKnQix6fXQIMzPZ9qZnnvQ+0L01IVa0/cRKHjIawESW73ANM+Dl4Gpl?=
 =?us-ascii?Q?I49Xjt1pdHdjCT7g0Q/Y975shpvmXaaHkOLWHmbVb6zOdRUyXHPcl5pnLR6F?=
 =?us-ascii?Q?xnIq66APi8Nf88uq6rN0t7IJqHkHC8ZE44hbSG4MbaBG/kEsfM7i49cR55v5?=
 =?us-ascii?Q?uaF06UPasmbefDGGnCLf99EEgM/6QVmc76E52MF7d40M2ppC4n9hWECWl04d?=
 =?us-ascii?Q?7gWvrvV2Z3bR3CuFiE2kRUDmcA7aVqTcdYVyW9ncqKMj0MG3uoBcn7chCW7t?=
 =?us-ascii?Q?WIpw8gdxPDZT3kSnLZ5qkH+HO4oZezyOfNwmlpK/6xKncqblysuh9UeT2JdO?=
 =?us-ascii?Q?S0aG3xnTZSD3Smh01iINHaE1UQYTQvrrA3Ro1dtYW2CzKm+5SUPGukRmGFAC?=
 =?us-ascii?Q?QsWNBwWeNc7IXisqTaxmL9Kv7rUV2m+uanZDs6p3VTetLvotFBikehULSS+q?=
 =?us-ascii?Q?RnwbXrlQvu0aI3ZYuenQfuniuc44KCcZepBukIN2zjOX29pSDCWL/zRzRnBl?=
 =?us-ascii?Q?gU/OxD2fR0woLxJAP7scMOobnZjTlW2G0PHdZGwl8woYHwa6XP1odkJwjZCu?=
 =?us-ascii?Q?SkkcBqEe9JGsa9UY6kCCDHNHUj26oh6DsIwYgQNvmnTCyGBcu/jMpZkhPfGR?=
 =?us-ascii?Q?IrCM9mgkh24se8lgv1RAd1Th+KflOFoO/1WzgHfk0kWS7ySY+bPGm+evXsVz?=
 =?us-ascii?Q?FrMLwuck5c17cymfdsajHIXNjJkEV0QTeeaqAOeN1xw5NC1tk3WwCOhEg1gh?=
 =?us-ascii?Q?Il7q4csm47DWINVDrn8k44HQIgGVBHQlBLM9bPrdOu0bzo+JEf1olg9zvnfP?=
 =?us-ascii?Q?IwftcPMKHWnbp4hTt1ezLOZtIdkc0WoJgTvWMex3cs/oWC4M+m2r75jG2E1q?=
 =?us-ascii?Q?aR3/7Qppsh6Tq6A2rXhfnPQ1RTUA85/Av+wMdUHp4ZYRK2NT9eWG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38139a0a-8b8c-4047-0216-08ded86e7eed
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:17:02.3031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clTkv6lMxZOwrOszBmd/G3ldeg8LeCTBlma4Fa2hzUXixPOHNhQ3XH1Hb38ElzaeRzdIR67DhrXGtjb0JPtpcIwZK2/TEz68RW4Hn4KaEmt5zbb+d7tr1OgJ3c75TtXj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_121708_073453_324939B3 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu, Jul 02, 2026 at 09:36:44PM +0300, Adrian Hunter wrote:
> When device_register() fails in i3c_master_register_new_i3c_devs(),
> put_device() is called to drop the reference taken by
> device_register().  That drops the last reference, so the device's
> release callback i3c_device_release() runs and frees the i3c_device.
>
> Two problems follow from that:
>
> i3c_device_release() does WARN_ON(i3cdev->desc), so it warns because
> desc->dev->desc still points back at the descriptor.  Clear it before
> calling put_device().
>
> After put_device() frees the i3c_device, desc->dev is left pointing at
> freed memory, so clear desc->dev as well.  That prevents, for example,
> i3c_master_unregister_i3c_devs() seeing desc->dev as non-NULL and
> dereferencing it.
>
> Reported-by: sashiko-bot@kernel.org
> Link: https://lore.kernel.org/linux-i3c/20260701203053.8F3971F000E9@smtp.kernel.org/
> Fixes: cab63f6488761 ("i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 979457e635bd..7254b13fe4f0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1942,7 +1942,9 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  		if (ret) {
>  			dev_err(&master->dev,
>  				"Failed to add I3C device (err = %d)\n", ret);
> +			desc->dev->desc = NULL;
>  			put_device(&desc->dev->dev);
> +			desc->dev = NULL;
>  		}
>  	}
>  }
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
