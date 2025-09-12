Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D43CA101F
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Sep 2025 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh2XD+oTAIsh2xDQaRHmyWiHnIeMjFpDpqJ6aiBIYgk=; b=bnUejzSPhVA3qn
	SMGhi3knjgwgxEMTBoZmUzYAZJX5zxqlQXuobN2CA4ahPvzqSxPkCLm4yUpQfWfYixGOFLc3T09pn
	umAIWw2Bl9qaIXx8h3sqSpDl5MhVHzbuWVQo4AzuukRyjciel19eSn/CFYaewkSDKu+M+6Zqsya5l
	Yse8ec/wBQlUu7m8VpyTdpT655t+L+/0UqkWR/W7vH1MTFHWfplAW9hnGun8P3lhzEk5zNJH623+5
	89wMtR+BKuYmzrVHZHAkOv+WPp6+CW1rnyWQWoLzi5EQIOkFSJbGFz/COlSZN3n9ZIJeq0M9B0i0u
	WJbYfwtL1+5g4GIoW/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4kC-00000009t09-0T6o;
	Fri, 12 Sep 2025 14:27:20 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4k9-00000009sy1-0F80
	for linux-i3c@lists.infradead.org;
	Fri, 12 Sep 2025 14:27:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUVXOhjrFtaxc/w/Y4+r25fYmbMu3u+JFMI4P9GNfnxHJKOICD+F4oImu/j4TzgsRHnAjds9/A4H7y54jxNVm3Vc8uC3XZzpJKT3RSjJRqGsHCXEL4tG8L6tmikjuuZOcCYWx9mIUiyPEzy3anUsAS1W0bot072tk6LG1h+XrQUFLfIiacY9ZxokdAY3XMicKYxFkYu0lD2QP+MapLlANKJz3wv9krf9oLKDAmfuhMudk+Vo39kT84SU4P4fsyECTMSqqLOElr5V38hM/2U5UTFqohYH8NzXtIzgoi5WOzvWehU92Tg+JhtfOIJaO+yLe11MQoAeDs0QPlMzN3L9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJHvZtTvrtsOqQRrH9i5bW4feqIZvcktsr/madUSb/M=;
 b=PTtIfuzxLjBbYaRLzxnF86y3yRABQQp2yUisKMk1R69T58um4iDXrm1BdNsrZMPWKnc2qpArMfbNTY46iSKNv16/nxbEivEm0zcKPNNqPZ9IehQ0VwcH+N0ENOH04YmO2PGdCTcWLzpDt8+yYIx2t/f9zElAT3tn1l/RAN1j0JGBFf8CrPAKrr5B38uFn8Ew8u5qwVIUR/WECs58VOTL/meeS0QPfeEFjJGx+FmO3gD0wlrgxQOBR2Y30ayje5EpFKtcFiMTJvQhpEvGF5su4Oj+EZMQAVg/2SmkcPWgiggqCzYCXhIb5DFM49e1birluwN0STGT9m4pSuP8cwFtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJHvZtTvrtsOqQRrH9i5bW4feqIZvcktsr/madUSb/M=;
 b=lLHoJV/VXDr979exBrvssH1Qf1kk6P01RzoTliLG36oq8AKEX5DTQQ2WGQ+8sXpPVGL9pXyDgYPQpAErlcjzi/rqisa5DgDK495b8spFvj+PgSmJqWTU5e3LeWiZ/xV6xAwosqIx5EPRnV7bj+ahM6zESFPka9vwv9zWKjAY77p9Xuk6HolDRef73jmdqv8GsHt6MSkBAW5IiFGv/C8mkv8nActA1I/Bo/DuogoruhWQ6xrXHeB/fC7G4q/cFY4mvQmn9LmzBz/suy2uex4RYJKG0/ztx5T4rytFDHd6m4MV3rUm/jB8waaIcpSpTc+NV1WlXb2TLXGxgkmazlLvEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DUZPR04MB10037.eurprd04.prod.outlook.com (2603:10a6:10:4d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Fri, 12 Sep
 2025 14:27:13 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 14:27:13 +0000
Date: Fri, 12 Sep 2025 10:27:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 4/5] i3c: mipi-i3c-hci: Remove function enter DBG()
 printouts
Message-ID: <aMQtuwjS+UUNNujB@lizhi-Precision-Tower-5810>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-5-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250827103009.243771-5-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DUZPR04MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: 116001da-7335-4023-f69c-08ddf2087758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2wNzTtbtRk08lndNVXTvrLpfc3Lzh6wx4iIcZm7uLBSM981eCkDoKqZ5RgVo?=
 =?us-ascii?Q?W+wNQUoVTUy9Wk6DTlSyeLh0QPpU0IH5u6Lxq+jQ7zWJOmYMHtO6I4PcSt3X?=
 =?us-ascii?Q?Mk/e9MSb32MdHO5X4Aslh0SCKOjdbVgFoW5g4BEP9/GJ6+6iRrnaPdWAegRs?=
 =?us-ascii?Q?9M2Mh8070w0clx0Nmnie6Mlq7VvCe1ADHG3oeWcJeZB25a6+jX04vg6VwNGo?=
 =?us-ascii?Q?msOrNEyML8uZs/NtOcWME6yvMxHLBaJPlTR8X/pw8HdjRwK05FgoFjWp3v9J?=
 =?us-ascii?Q?U+R8+F9N7xPMUiDqq+N5YSkFg+NWCiaoHd3R+/fYJEMKHCcZn5R5K+BvMBg3?=
 =?us-ascii?Q?KiCVbYxMeeEDQLUhR5GBDMpx1YigPMoCt0KqIOWwoDj3CRNflwecC6n1a0ro?=
 =?us-ascii?Q?V6Ii61dwKDPbBRAQHDSPvOxgFS++tadlBALscwkR1gtLDOWVA0DnQ6jHzw75?=
 =?us-ascii?Q?Hv1uiBfFIqyLa1Um60wPeFosd2lIj/sxEiqTLKyqvnINHWZIHQ2TMC/iIWxv?=
 =?us-ascii?Q?xlR4/Kyucfx/ANyCFkbbi+X9jQZZuaOOP0y6bOh3fepVToePny1UxmE0TZco?=
 =?us-ascii?Q?G2jbUrtpgvpUObNe+FuR2GyUZTT1Joq86X48afct5owvR9qdF4UAM6Hnxpph?=
 =?us-ascii?Q?qvgmzgT1aUf3M9jfURMMnxG0Gic8FSjCe7NSuQfkCzwoSKpJ/O0HqIHpCBfb?=
 =?us-ascii?Q?2s0SXQxHaU/k/r9Xp7gyvuwQfMuH199vtUJMxsdxpzJwdBb6MXky2dW/PIPQ?=
 =?us-ascii?Q?RueMbOBRfs6gqoVlHlI3yV5jkNl3Y4Tnjxt2/ktdGSIiBdhZdajrgIVfk961?=
 =?us-ascii?Q?EkwMivFHFVKERp2TZl98OuOaYVIAiV3rdHcvsJWksbKKeXe5yC4mSLCDXr6a?=
 =?us-ascii?Q?gBC4nKNagAvIItzf7suxuI4cn0PpI5orFOw71wPaoEHewrvKKvNCHYTJNDUG?=
 =?us-ascii?Q?XrJz2NvM55VoJrFxH9P4yNMGxIv9ENZ6i6FuEIqu1UzRLo8QaJ3/W/Vrxha/?=
 =?us-ascii?Q?MTOohjyZBl3Xn9cOk+lgzTi3PiQq157Y8DRsUQ1WLu/7q6AQ9wKdydewAquY?=
 =?us-ascii?Q?a4rtu1kJXSGA+At3r/xoAaRcTT7xnbL/xGjJpCJMkRxCWKnD+1IUll8VUi5w?=
 =?us-ascii?Q?P7oK7Fb0j92VC2CPWNqVmdkMFONu5yuTgXLN+fKNbRVejuwvnJd5RxctUXOk?=
 =?us-ascii?Q?7jGY8yqMrAPjpT17Zy2eUkFga0W5SQjtSqRjw0dAqbbDjzjAOFilLUN7VURL?=
 =?us-ascii?Q?dgigE27BKhNEyOVZ5Ucfp82cGCVB5SG6cxxcyZxqnqO3kie0lxcGUmdaiVtR?=
 =?us-ascii?Q?EAJ0/cF98MeimNs84amh3MwvEShZbxgpm6J59ecPmM+kD1/RSlR/6AwNLhzR?=
 =?us-ascii?Q?4JNXLI6FQ5E02dS/dxhL7k5Xc99W+y3thLEbKsOdM+7NMJn0KNHJKqkLn1rB?=
 =?us-ascii?Q?UiVwUOiUSrDRhkENC6nNmasYKWMVEaHfcS3lO/R2xLmr9UF12uOfyzzk+ly1?=
 =?us-ascii?Q?ASXSu/lf+wQelhE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xMlNGv7K6V2WVN3ZtBlqBq72XIMfKiKWlMEPGJ4QJF0PvPZMQjVJobg/PQFe?=
 =?us-ascii?Q?2U1x1F+ECIXfG933mPNFygPvrhX/VvE5zQs+ahWV+TsAgCGKGKMESjdQ+cqb?=
 =?us-ascii?Q?QrGZW5n+muHeyRsBk4zO4xn2iXU3XIdbS0McvIe6PKsd7PHltZqB/0F9jDZw?=
 =?us-ascii?Q?la7KzbqSKBRzcTauSkorgnXz5AEFO8XH+LlgUw1U/8Ldmor2ZY8cVTIXOQkZ?=
 =?us-ascii?Q?yxq6VFeMm44xcAyiHudKOmPSAqpVf+2AVUauV8KUuFnyQvKAxPHOdjwXxDQ9?=
 =?us-ascii?Q?phWGUEB98FRcCmx+Z+nH5EQQKM8YfuknQWC0KQfREGo6TWNqaDc0uxEIanaW?=
 =?us-ascii?Q?hWGETLOFzOKzCOwo6KGte3ZNgYM4os5e5XUbdZdYeFdRtASbEEHL/NcsJKT3?=
 =?us-ascii?Q?8yDqedJTiRfXgQ6sDt3WrsiW5rQJe9+4ccyjQbsmHULJBb39n0e7iaKbUehj?=
 =?us-ascii?Q?4BXmu++0VJIYIkCiKOcfC6fpSFlnhe7pBXj2kTbHM2jxYdAx1VIOshXl+xlX?=
 =?us-ascii?Q?dKq5Q7AU5xJTF02+n8kbmRA2c9DC28JUom12HZB8GPy+R/DoDAPlctTbSC7/?=
 =?us-ascii?Q?cw/gp9+tj+Ds5rPzUx63e8zMCt1A5VONql8s1Eny4nAqkD9CnvxBvWqksRsc?=
 =?us-ascii?Q?p3uyujCh0FfHdB8+n4brtmk0OWrN+xy1/EShdCBArfLVZIZJrUcPLRGWAniC?=
 =?us-ascii?Q?HYZA4jTlS44KGgarva45LVnCo6nNvvMtz7yWcpoSdoGTzNF8P07ccJRMwjob?=
 =?us-ascii?Q?6UgqdV/CexJhHOaUI0BRrK4j17bow4wG2qxazXdRYSxC9bmCNYB/zh4UMx1t?=
 =?us-ascii?Q?8x3Jo0FDaBhNBcB5rEie2tJKtL6DlHq+foYP/dEcCRVCC+f6iR+ZC6HCC/ez?=
 =?us-ascii?Q?lMtucIkysDmvm6dQKrABFHcRY+yTJ0hILnXUi17UbkbeTb53vfglbNFnrviT?=
 =?us-ascii?Q?MEWjz0QV/8Y45Am7jo3xHBmDO8hl67CJyrrIt/2mlrxIOOJ9OjcB9nYiMgfq?=
 =?us-ascii?Q?K//F0Kjd+raRoQzqpnA2bf4RzEazfzCQ7ha/84pTo8slJyY1s1GAeqV0eDw7?=
 =?us-ascii?Q?YtNetinpOAAPGB72xyKQPigZiiTIOeVSEmjKQsKVYn2WhuVP3uCDiYLz9tkL?=
 =?us-ascii?Q?tXT3Kn5odRIz8nSw8lBaQ2LXESt1GZs8gPJxZ+cOx/ZZBFvShqeIBsS+z7Ca?=
 =?us-ascii?Q?VzISDqeQR2G1jE1+Uxwlw9ThKQX31BZlIsRZ9mjeuUQ+hhSXSsN8Kec70FpY?=
 =?us-ascii?Q?W9Q9V4HdzWDKGCTFlHgUTaPjAavQL9txpze4rmIxayR11CMxk4wcaB7nSC3y?=
 =?us-ascii?Q?7ORyesIAVHbPcYvVp5p6qGpqgsuyPSI4AJzoiAq69iG95gPBsO2vPmJv0PfG?=
 =?us-ascii?Q?nwNKtFbsB4LydzV6S+J3KD5PzgXp1ng7nGDjA7nFOa4Nt4YFRMhOnpHFgUCU?=
 =?us-ascii?Q?KN2JogKjf7EVDdszu9d54C3T1c0af9w4qVcLc2A7MIbRc3KEFQblp8TiVgI3?=
 =?us-ascii?Q?XxPtgDsUGQcGMMK410o+pthwaZ82inwAX30vYGD8FiXHIvo70kXJ3rS4Ab1e?=
 =?us-ascii?Q?0hywgBU0N9+x3d7as1I8EBrGQ99KZKeoo9vRy4yS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116001da-7335-4023-f69c-08ddf2087758
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:27:13.3409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6QLQJixjl5nF8R4v071fjPbIdjKZCYV2VE3qlyEL37nP5azR7CBG+eicIOpFHDPEfXnTiigtT+pPZ3J7tvrLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072717_098514_3728EB2F 
X-CRM114-Status: GOOD (  17.78  )
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

On Wed, Aug 27, 2025 at 01:30:08PM +0300, Jarkko Nikula wrote:
> These function enter DBG("") printouts are not very useful in error
> report point of view because they require code recompile. In which case
> they can be replaced with more informative debug prints if needed so
> remove them for now.

I think simple words should be enough

  Remove useless empty DBG("") functions to clean up code.

Frank
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index d532933ac7ab..9932945ecf06 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -121,8 +121,6 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  	struct i3c_device_info info;
>  	int ret;
>
> -	DBG("");
> -
>  	if (hci->cmd == &mipi_i3c_hci_cmd_v1) {
>  		ret = mipi_i3c_hci_dat_v1.init(hci);
>  		if (ret)
> @@ -159,8 +157,6 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
>  	struct i3c_hci *hci = to_i3c_hci(m);
>  	struct platform_device *pdev = to_platform_device(m->dev.parent);
>
> -	DBG("");
> -
>  	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
>  	synchronize_irq(platform_get_irq(pdev, 0));
>  	hci->io->cleanup(hci);
> @@ -267,8 +263,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>  {
>  	struct i3c_hci *hci = to_i3c_hci(m);
>
> -	DBG("");
> -
>  	return hci->cmd->perform_daa(hci);
>  }
>
> @@ -385,8 +379,6 @@ static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
>  	struct i3c_hci_dev_data *dev_data;
>  	int ret;
>
> -	DBG("");
> -
>  	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
>  	if (!dev_data)
>  		return -ENOMEM;
> @@ -410,8 +402,6 @@ static int i3c_hci_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn_addr)
>  	struct i3c_hci *hci = to_i3c_hci(m);
>  	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
>
> -	DBG("");
> -
>  	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
>  		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, dev_data->dat_idx,
>  					     dev->info.dyn_addr);
> @@ -424,8 +414,6 @@ static void i3c_hci_detach_i3c_dev(struct i3c_dev_desc *dev)
>  	struct i3c_hci *hci = to_i3c_hci(m);
>  	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
>
> -	DBG("");
> -
>  	i3c_dev_set_master_data(dev, NULL);
>  	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
>  		mipi_i3c_hci_dat_v1.free_entry(hci, dev_data->dat_idx);
> @@ -439,8 +427,6 @@ static int i3c_hci_attach_i2c_dev(struct i2c_dev_desc *dev)
>  	struct i3c_hci_dev_data *dev_data;
>  	int ret;
>
> -	DBG("");
> -
>  	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
>  		return 0;
>  	dev_data = kzalloc(sizeof(*dev_data), GFP_KERNEL);
> @@ -464,8 +450,6 @@ static void i3c_hci_detach_i2c_dev(struct i2c_dev_desc *dev)
>  	struct i3c_hci *hci = to_i3c_hci(m);
>  	struct i3c_hci_dev_data *dev_data = i2c_dev_get_master_data(dev);
>
> -	DBG("");
> -
>  	if (dev_data) {
>  		i2c_dev_set_master_data(dev, NULL);
>  		if (hci->cmd == &mipi_i3c_hci_cmd_v1)
> --
> 2.47.2
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
