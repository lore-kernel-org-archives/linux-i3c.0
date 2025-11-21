Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96205CFC28C
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/GE1KZs3yX+08J7Uw4jps0kgJeXvYbOlRMnVUXRYbQ=; b=DWa4biR9FYTMnv
	WuIsIcDmJoO1G6LzPt1xbYxYbLhdAD6mWkUhAA366wJU0GSyVLU5ASVgcDF27CNgBd6a29oVlEvcV
	BnrbuWT0Vj6UC5q6vS1iACp4uxld3puif+nO3OLqGkNWGQgVt2PLFaLjfM6UsCO6FgO6KAqY6H10C
	Jfc4oRp0IOfIVy+Acj5IRL0L6ewg2iJAG103tDkJ0HQn8kJiUzSWQ1y60SqVjPCwVszTKhNQQayjd
	95JapzLelDpniRUOwM1EJFg34fJBE7ei9L/Wa4DKIKNgLIPn5kA7vkzuEPTekKEcSTpwvgMbGq4Jj
	6wtRi9boChXbTEHe9e3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUf3-00000008mY1-1XNr;
	Fri, 21 Nov 2025 17:11:05 +0000
Received: from mail-northeuropeazon11012052.outbound.protection.outlook.com ([52.101.66.52] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUf0-00000008mXS-3esD
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 17:11:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYvctR85XMIk0kPDx2ysuoZnEKWWLwe2D8TNWOjm80sdy9Y35eXd1M2juCw0V3+DJdheSDHZvaj7h6KggxSO/+WFCKWpApOIt8n9vguVeZmzJHxQdGGLcEkCbo5EFX2mJXq+2n861d9B9C+P2vGY/NT4uDSo/ExebzaRutuewLqzhYnR+W9ytfMxTwjE2yQ9fR9ibuaYfojKzkHncmhtz0Q9LrD8pyOPQ/ifl3bMZJOHSoELtGLfiWAcfh1kTDnaD+YIoc9zdjmzT9xZok+LTn9A07226Jw9eOvM/SYEx4csn40AQeAdJqCQQXIB1MagO6GKfZVmUmC7SCfxHxoQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l81VW0D6LjN2ZpdK98HUWIh5yxfZw/0GhmlCp0ipBfs=;
 b=aNX92p8zox2NBFedGmkaOZn7UYTF61bZORzkfX5IbI6bfVvAfw138+ReR/WbwPxqsp1AOhTt/AmBNi2Js52nXZpFZqbzZaphxd5VRSKMd0N8T63esolMY4wb/mUx2IPuZYgbdcmkbl07wnjiAIRtbXhGClvc8nBHvW0ZbCF8Fho1YlwgUjp+Ri9z8mvKJPWNkwkcJPFmElpU0HbzHA+IviNbV+tlbe+5LK3E5p26oaTMQJvmOL1higvDw36JCQniHrb/6ipsvPGGuNVc0rLjX88gmwhKxeRIxi46l/ER723EOu2mb5Je/UMPPZHhz5XkwvVnwv45XlT8p7hGRkKhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l81VW0D6LjN2ZpdK98HUWIh5yxfZw/0GhmlCp0ipBfs=;
 b=MqxFJ/n63BIpJPReocTRWXD+abOa1kH0x+Td4hFh0ySAc/wpceaOMsNdvnal6a1gZE5k8XSbj4IvDFdfl/KM6pLydUYOdFGsLldnkR3gRKilz5JmWJsdAnWF/fKBqc8lmgeJbQNSXsWZshhokGbBD2XFHpqd76WYw+d73MZYpKfZo8siEjFOR1ecXpAxlIT4SPZ/Z1MF6veXI1LvuUKVKzxvSJatKQtxASeu3SfgSnRmIhq3vkPiuK3PGG06T5VLdysEG+SEqLh2h7VB5JOnl5TzWl7Yxx/7LZog4Mcc7vdrUGh0npU94t/qdpbeJxAoJXr3ltn5gHDfepVdKHzMUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 17:10:58 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 17:10:58 +0000
Date: Fri, 21 Nov 2025 12:10:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i3c: dw: Preserve DAT entry bits when restoring
 addresses
Message-ID: <aSCdHMySnRSv7fJz@lizhi-Precision-Tower-5810>
References: <cover.1763703573.git.adrianhoyin.ng@altera.com>
 <63e1b42ad7b3ce32f266aea7814304123bad151c.1763703573.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <63e1b42ad7b3ce32f266aea7814304123bad151c.1763703573.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM7PR04MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9689c2-f0b4-4801-9ac6-08de2920f0a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SsUx6dlw8J0vqONGeScoPg3Bf6vYZev9QDiPMK3dv7tPpmgAq0zkDlT1sDdH?=
 =?us-ascii?Q?gLd1OnvppoNADVxfirl6pfAGdfkIhkcGK8sJMIqQru4+CyrXy2jlNSHSGZwZ?=
 =?us-ascii?Q?SCDxjNmI355EReLvSex5CUfstdxBGw4VZ9slFX8Da+qi30FXlUt0nO4uhSGs?=
 =?us-ascii?Q?FIRaRkO2nOlmWdhn9PC7sAm9+gm7OJ3bD5/cGqENRZR6UoCKGFZ1FGoQzAW0?=
 =?us-ascii?Q?i13VJ44+FGJpVcKkfsBfO52sxH0HeQZihYbzGEtsV3LFRKeKF3i/1RCx1mQr?=
 =?us-ascii?Q?IBbv+YbKHmRbok84YxPxLSD+aJgULdkqlKrrcf3BQOInkC2Ey3TzZsnojUK6?=
 =?us-ascii?Q?SACDbDWXoK/yOYcGFiRru+5WcXDIfNWjSW9QnXCN7R5WGhgBCxA4q7KmFFL0?=
 =?us-ascii?Q?ll8I1wmYF/iFVS4ExTxXSwCEkIktDS3J7yCYyxivWMV2SSvmfZi6T0XY8O5D?=
 =?us-ascii?Q?cCT98hmjiod5Enlx2ZzxQ5bY6u5kztJaxSb76rnLBwrpsAjhXU7Lyfe19Jr9?=
 =?us-ascii?Q?yMPLWGTZAe2LYQOxslpgn2xxDqJ/9aJS+wpUIHgLbZivmJ35V+eg/HZj6M2A?=
 =?us-ascii?Q?7hp9uX6iubWMoiZqPudiX45WQQmmE2UuK52JbMKEg9ircy+aZtNOO+Ju/cfQ?=
 =?us-ascii?Q?JRYv51X73gTF6ha6PcWrl1mnnGqW1WyYVGSPVCBDj67GlN2OR4+OpZ945JOB?=
 =?us-ascii?Q?X4yhk8aBeRLvYjlqGG989LOaqQvpPc+SiJxqPLXdwz1DvS9STxx9FWzRM8BQ?=
 =?us-ascii?Q?1BHjSmTEY26ezpqb6VlL6/w+NXOhuPEuY71RtP+FUr2DOJgdC4BHiyX8tckE?=
 =?us-ascii?Q?I6+RpYuFKzxmq43XrgpzK6CondVuBGFI/CA+HZcDNar9EVYQIKMZ6JBBC9A4?=
 =?us-ascii?Q?mR33JDXOwLX8qTbpVz1Np3BS7S6vBgxBrRkauincQ7I7aIjKozQ0MWc+6TaF?=
 =?us-ascii?Q?PGBWDDMGbKEhGPY+hwl5IB5+/UihwjFyEFYBukDvwK4hFIWgv2131Dw01ZJk?=
 =?us-ascii?Q?uFSBXKMMHjU7vut40pVIPRKUkQQfgzWofqG+STz5Hi4HMyt9TWofvdf14NSJ?=
 =?us-ascii?Q?XlfWktF2Wj8vDsu6p8Om2rDrr4sk+t7hOkSeHpRUgZlipKiYuSXQWEpkfSej?=
 =?us-ascii?Q?sH3HmjJc5vw5mu5Da0ImuB4jNclyLqP3jJFXjC6f3LGCPnXgzJEXFY1HTzqv?=
 =?us-ascii?Q?ydlz1Nm/ugBabFnRlVA2OgFTqbfEUItDPtCOEoR3fHGj+q/5RNLCF57C3DKB?=
 =?us-ascii?Q?dYqvcT2Dgwtisox3ybzUosv/vN+LgjOP5afH6GmNfCrqA/Cki70nxePmjTlA?=
 =?us-ascii?Q?x4kZFFAH/nuQJzy/Kx6R7tbnRPvACKeHDqJPDc08l0BtYNtwemLuhon7ZK4W?=
 =?us-ascii?Q?yZVL5zdF4cDHIVJkdFnCS+EJI4boTWqXUmDEyrRCdOUlzKCyG+8+tV8fSAyL?=
 =?us-ascii?Q?23dQsu0BZSTVrlY3TEaKOh6UOODct+ann2NwUgtiMiooroq3WaBEnTdRIGtW?=
 =?us-ascii?Q?9A/RlvMcwgf9bOXZpezT+9uqx/5pUkBVYm54?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?baVDpnD7P/y5ahzx0P1NXfm1ILkIqxprTT6klJ3ikG025sagEhCBzYXl3f1w?=
 =?us-ascii?Q?do4V7U17Fj7EoRV448FKhOOCuCQd6aoZjD1T0rCQhRyTvdbJwjc337MCMkSN?=
 =?us-ascii?Q?nw5OEbaVhEXUkbuUE/jkhRDzdwzN1QacXU7swTFO66laaX9+t8HnKqpvUoTk?=
 =?us-ascii?Q?C140QfRVSJg/8ip9cb5H3sIKz23AV6T3MmJzvIxnTC3G1yNkT2A3eEdihqcn?=
 =?us-ascii?Q?Xn0Yi6OppgiPz87sbjtM0luesmBTg90qBEVX9+/TFxJc4d0Mg+lHH72i9Jgz?=
 =?us-ascii?Q?m33ju3n7dwPvKF+CdDEDbwoNZsLJauWN7bNQpdkO436LkiUQkmHUp6OtUQwS?=
 =?us-ascii?Q?rhMYzlV+7wWj+cjFEgjXgKONBvZM8CBEM0nWnQW5cFMG597i6dj0yLr/qd5b?=
 =?us-ascii?Q?9qsr9LRFWK6FhXYAoR4PSXTT+Q8KeunoIiCmG1Wxt0mmmjWLyVmBAI+n1oll?=
 =?us-ascii?Q?5Hg2BcDQafOu+IlffV73LBjyVleI1fEES28LDETVkcHnDpvt/d2k87Y69OWF?=
 =?us-ascii?Q?7a5UEh4VvM6OU/RseT/hYJ0u210B3fumR0OOa/0ptVfpwgA79u7OzC5N7RJk?=
 =?us-ascii?Q?WrceNdUgwo/JBeceWYFYA1iQ6uy6XfWoYDFPtx37uCC4GAIrr9nIeQfwScfb?=
 =?us-ascii?Q?e9SEVIQXsYhxmoK+x9+jDaWCEsoylH7EXHWGhiOZjEnaLe+sW/pKFjrID1bR?=
 =?us-ascii?Q?fmMDnQw6g5aMVpk4CRnXCJWdpRiLgoVKRrqqK0vJvvEXYaYIMWpOwG2k8d9k?=
 =?us-ascii?Q?PKxz4Vsv9j+GFX8BaRay1gb4Y/zZ7snXgxluAN+FVD3RdsdSeVMv6RROBAhB?=
 =?us-ascii?Q?H+qMJk7+3tS2uyt2p0Ky+m135159EcVM4PDzsgf0UA7Bn3O2IeTTaFyTa48m?=
 =?us-ascii?Q?TKbRcdv80GF3N7U2TJeqHyZwKW18/pIHyAtRiiI7kIdY4TJXnPTQ6Itm9vvt?=
 =?us-ascii?Q?VDf1ya46yR/1E1hjC8ae99UD9wfBZTJOGSQTvpyZv0WkV9J6IYXXWT8JRwq+?=
 =?us-ascii?Q?1Zg/hEYtjLQGzXC/qK8hSa5rmI5T8/SHuwg0/MzJUstdF5tWqpkLFUk1xCLF?=
 =?us-ascii?Q?DlaNMCuKyG9b1L356pUx/1IOoTAlHJtK+15yMYtAX3j6dDGdXo+5VODtDS6J?=
 =?us-ascii?Q?C5Do2j762vP7LsF5OBraDDVuT7MF7pqxfXnbhJC+VAdEsbvXc2kHswrgab6U?=
 =?us-ascii?Q?KUNkYsvF/LImpCDv9HUYUPpIm3Flx2jx+ZaI1L2GnsC7/rXhSXgRInLxoxVw?=
 =?us-ascii?Q?Q/jNqbwU0IHJJ6q2AvfqUVnQXktiT1EnjuR1LO4qJc25YQNBUXt6sCTjnSjZ?=
 =?us-ascii?Q?Uipd2uoUevg5S4Usk0bu08KzpizTJF/lscH3LPljOuXvqROQvSpYGgZ6lzq9?=
 =?us-ascii?Q?QDgHFnCNhcicVTAYic6o9ZNEXQvMpxHsxYXRIhTjqk6wQ/Jjyg6rv8mEJtrq?=
 =?us-ascii?Q?RbBNK9Pm8XicO2X+aB5LAbUEn6xqDY8nZD5jbzkZDE7q7fixn5DNSBSovWq+?=
 =?us-ascii?Q?G0GOuG1XFhIPMsu/ustSOLBKeXp7vKbqkbFNNGgwGGGzEbj4DcWE55FbSOGY?=
 =?us-ascii?Q?CtAesoma7ubLHPikUHomJS5JiBPwCwkIp+l/xgnr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9689c2-f0b4-4801-9ac6-08de2920f0a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 17:10:58.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6O1xaaIoZh/Y+KpT7asM8s/2BFXigXEbVl3wn39v9WM7NhL6JRS3t5XqS4SEMP2LQLcC9e9V01NYBiEFV3djA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_091102_915640_69A1E190 
X-CRM114-Status: GOOD (  15.54  )
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

On Fri, Nov 21, 2025 at 02:21:50PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Update dw_i3c_master_restore_addrs() to preserve existing bits in each
> Device Address Table (DAT) entry when restoring addresses. This prevents
> overwriting configuration bits during PM runtime resumes.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index c43eba615d8a..ac3c2d3136d0 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1718,11 +1718,13 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
>  		if (master->free_pos & BIT(pos))
>  			continue;
>
> +		reg_val = readl(master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
> +
>  		if (master->devs[pos].is_i2c_addr)
> -			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
> +			reg_val |= DEV_ADDR_TABLE_LEGACY_I2C_DEV |
>  			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);

Suppose need clean addr field of reg_val before |=

address value may be wrong if addr feild is not 0 in DAT. Or you can make
sure it is zero.

Frank

>  		else
> -			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
> +			reg_val |= DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
>
>  		writel(reg_val, master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
>  	}
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
