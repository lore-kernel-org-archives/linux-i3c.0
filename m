Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37CFD7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OYC+sjPKXp1/UqVw6QwAY7eX5HlAp1aK1HHeH29s8g=; b=TbxP6mAxcUumQ0
	u3b+7znyLGJAPrrqvbZLw5KYqTsRNxTff87UGjst6zfqQCEx7V7RSMwCE3fDGd1U5YdKcsTQcHlNt
	PymriLR1SQDDYuGcimbpVhGy+XGWxzxsS9EnOQEk/O9dzAlslzCyYG+jknqGc+JY8j9i6OtI60o68
	2XQAYV3Z16hph8hxzr3tuh3qgfnAVqraZN/RicElIM/SWkTp4ZcCmZbDeYI1QpH5QQskcqOyIc72P
	Pjt7KS3mCJKNSLt5zww0vbECEvix+KUmOrggCc3ilF7GTUm+pE404tzOL3gKV3YXOdyyMGrUWP9YU
	HTf9Np7jSwjx9aaMEVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdJy-0000000AeBB-2ElT;
	Fri, 19 Dec 2025 16:27:14 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdJu-0000000AeAc-3bxb
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtzVkAril3vFfqEnH7frU2az3/X84xTaK6rI+H8ZTY2edL2cQLMkcYUprRYuAvEjTVW24pQeSGMgLz6PTmO3g5GIvGBGTnuKjShZa2XFZ1nVRgtK1EvnPs0/jKRnkDyPaYe+Bp3mM9vQ0RxythzubAq0rgNrYugsr62+pEiITQV7cN5nLwi8T5upHQkZjo6XlucNI7ZdbUQWbvCwFqQkbu0iZAx5HwNCCuJWKjDpHJM0CF8OAzfs8BaINc/JrBawqOtsaEdGjElIWgyAfVY+LmJiC/AelHBq7yucjRS1MPMHnuxMBcJ/aLoaW5SnGsj6Koa+x5TJdSy3CHn/jzgUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyT8ix2tUz+4nRzMQpAfzckj/Qo28/kQ6UGWbfd30Mk=;
 b=a/53FM2IU4ZgMYpIJPNl3ijMZObazFe/O8NzVygRXhID/DJkwAiiQc5s62igA0AW6rElExzSDaCtZ/sBoqQRQNIL34imMhVfZ3nWFB7MmWEQ7G38jZcK+VGxiOuAeZluqVO2o0tQDEL7wxkxia4a/uyAVSYl4K+jOUk2FDWFPyev6p7NPIACLJGR3+NxmtP5IFVLYC/p2j9Tgq79HY47bWfv7ygZfD6WldShfC/YQpfqocciltj5TozRXCqRsGMuw285VqfJEF2YZWFRCIZDYvmyVf2b0pq170tQpxM0htIwYS5mbLvGjrHgwaAKqhynXuUlebCaZ+tinyvSdvhmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyT8ix2tUz+4nRzMQpAfzckj/Qo28/kQ6UGWbfd30Mk=;
 b=SiVZkdZunP1l9ZGbPM1s5+uL6Ehv5fdGJva8/Fg+y2fg+S51GOoT6pUDd7Bf/OLtncfSrIwnIS1aBBvSl1b6SGRdCpKbZk6F76Txgkg/h1TN12YHg8DOVqLvtx3c3wnr57V+tbCKJVXf3v6yRPLj/7EUqvx/A1i9SkLOtFxiM61vKz4EG2JiltJexx276upUCuVAU2jwZ1dXF/hONE9dXmPF6bV6Y5UJJ35pLjWGmHmBSFNrZClbd9sNWqVoWWvgxxi9sIR6z6ZDadAgezptvVeLK5S9KLw38PnEdBP1eF2TZuWgk5vbrnWNBubqEUWqjUpR9HOCN1VyrKLQ1JUixg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB9320.eurprd04.prod.outlook.com (2603:10a6:102:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:27:06 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:27:06 +0000
Date: Fri, 19 Dec 2025 11:27:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 05/17] i3c: mipi-i3c-hci: Switch DAT bitmap allocation to
 devm_bitmap_zalloc()
Message-ID: <aUV81Cc/MKe1MAgH@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR22CA0009.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 3252ff09-4584-44e2-30fc-08de3f1b7313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A5T0Dy3Ghd6poOuiz+x2C+jCYh5RuGI32XXSDiLK4t78rBaSIRRsnGByxQz0?=
 =?us-ascii?Q?Lx/bz2afJjaZk26hkyWF2xdFNcpTitvGegfmsfvf5+fcvN37TK4v5yGNxAYg?=
 =?us-ascii?Q?mAyJsVmqyGzvt+l+ai2ACpVwk5M7oua5Sj/rcW/LA0GbmnjSMNrcQeqZisyn?=
 =?us-ascii?Q?/oeIXVQXkXfvrBLl7/ici7WH78/RAYXTUaL/DI8t5uzTptK8HippF4Xzc30b?=
 =?us-ascii?Q?lr2dSmpVLqtuF0Hl3Df7kv/NaaQ6rxqpKYHhzqD0OD71tWe/zA6TRzeDMB2/?=
 =?us-ascii?Q?9gI+CF22/kvItP8meRyHOAHveXmo6hDPS2OhZpvmrH0dAHSosoXRKsU/gKnB?=
 =?us-ascii?Q?v8GZInsLYIWXGsLovdANif1YzgSrGVWSX6ninFc2P5Tpgc+CLLAg6ewyS6SU?=
 =?us-ascii?Q?MUot8lMgc2xJuUmEiXEd6SkpdMeu7iqB554kSNQtI2bz1dM8hZTb8jRaaqih?=
 =?us-ascii?Q?gneMyw0QEmZM0/UEPPHdQSCZRN17/N+EO8nEnEmWi3IYiXEvcLEskxN4WiXj?=
 =?us-ascii?Q?knTQcP43BwO+Rlg5t+LOtMLiJHVJ7Fj7k6WovFADJlI+Un271x5lZrNdXpm2?=
 =?us-ascii?Q?H6pQaNIIsXSbA71f0vmOHCVbLbAvgcTpH/c+4HY/whJvlIPoqCxJdj+DYqcL?=
 =?us-ascii?Q?KRsgw61EaOp576Ajsuv0mG2ZRbqVqt8CKduqtHH15JdeE0z7opLSKqL1fr5H?=
 =?us-ascii?Q?wm4xZXKOJ+vWA+dUM3JI+V2annB7XZKsB/MW6+xWBgSuJ2T1atzETCIPNOzi?=
 =?us-ascii?Q?X6/R/ngEom1l5zbVRATk8c1EPq+2wFFnqnzmaCIuVJaG0cX9FXiDgNOw7RCm?=
 =?us-ascii?Q?+tJQDqxsgz+b4zUOLIo8QS+yZqxlv5j9tHLtlKgfEgFIATpYbrSWEuSvZgtD?=
 =?us-ascii?Q?T3qT69MePh9H3aBk+Qt5Em015Mh2lPEbjnIlQz313ekFdmbxzJkNwccy7OiH?=
 =?us-ascii?Q?heayZqyrfKf5OrClgzzdNijAPlaQIa5Z+DcBr5DblYSuWIKgEoGK2X+AiUh8?=
 =?us-ascii?Q?JIXCEOVE1vd9frcTXNDbgeRVVRoEPxGUQ1qK5Pitt7bvZTerewTXYDWX48wa?=
 =?us-ascii?Q?2it3PyNjtf7Q6mWg+pcR5/iG6JK8uyRmhNddYckED025e9BNBJkSZRkXTnKT?=
 =?us-ascii?Q?EvCpXUOD7IcHxr6Af1XvOWw3TLbqijPYGLWCfbJpmzW1rF0/+e+TZjC1iTNc?=
 =?us-ascii?Q?UwIRggEWrBZeQOP6yXbPGusyRTFglSy+6jlwtrqz/s9sh5hpz9TYAJ/mQoHZ?=
 =?us-ascii?Q?rH60UhqUxl6u8AJJBCTjpU8DuQ2RvtgHzEOcEjw3TVGrd0aURJ5VwOVXqOYj?=
 =?us-ascii?Q?my21dZJj3blflCljy4W7FxAlHrX/w4A2pKCClfn7Z8UQaJL6xFTK78Ewz9YV?=
 =?us-ascii?Q?QRh0QY/tu9yRHERi5MYItTNnI35AF3++ZY/qRhxrdXFdkyvvnRW1FKBc37wG?=
 =?us-ascii?Q?ozpxZjYlzLFRBwQd3/f1rC8PywNKapEzC5g8Oo0pEPB+Z/TwwL3dnvM+zKEf?=
 =?us-ascii?Q?k0oJPQf6shWr4lTdwx/5Hoch4gx1s2g92wat?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dJcjXnW7+NQdWK6U4/vyqVtshED/nuw1Vx9C6WZBwRgR0S5FZN3l1yoNvq4d?=
 =?us-ascii?Q?kwx0pf2y+53CvUalXOETJcK/vuSn1DCR1+xggk6XwvGN4LaPWWO/gi4u479H?=
 =?us-ascii?Q?rR75cCCLJjNVSPFDQ1u2c584UR8n7SoWL2/o+m/tAt7gxQ0CEjamYCPzLbfy?=
 =?us-ascii?Q?UA/iD3IeP7J10kXvnlhXVSnKZFEZQpzGveJuzE965DXqypWLRuNMMmbeAlrt?=
 =?us-ascii?Q?GS9jg7W8TU/uDVQA4a9KrLOJ6STiy9L5PMmtHtGqLCH7a1s83EmSYs3Bdpp7?=
 =?us-ascii?Q?STFksYIefGpFAzVcHd50nQBpzYm38x+kcZCoD7uWVKSzB+ZTOjGgJv8E9O3f?=
 =?us-ascii?Q?bdLnQ/Yxgf96PM+GFwCagUAqiHeKP0o4jn5Iph/A3ZzjbkRm7Vz/K2cgtbT9?=
 =?us-ascii?Q?31g7wXId8GiK+j+3BgeZ8AK7VTEnvoOZk72q0fQCZb8OKVebZxPYanZmb5Qh?=
 =?us-ascii?Q?LJ5P/ShvU8U0mJ8lVbUPsaDgI5APE6YiDWPoPj3Z3CuM8QLdZGwiaPVr3IAV?=
 =?us-ascii?Q?ZEpqsLXRcXJ6KWryyT7X72kevd4rtYZAzJ5KAYxYvT5zDteoXB74FosCl4F4?=
 =?us-ascii?Q?TC3AmRbUYqiPZ7AhNO11wsj7FErII8uz6ziZToKdwWxboBqap7x9yfOadZ1p?=
 =?us-ascii?Q?nGskCG14JC/ZvBDw55c2PF0UYdmQX9DS0CHCp8HFPVHsTsHSIfrmJJReywL6?=
 =?us-ascii?Q?4bFHRvQQT6s/DD0LvrJB0jDA/5CuhbkuGsODKF7Pz877m4KkrJZP9Ysx4+pP?=
 =?us-ascii?Q?mv/tKNuUfgn5UQH/G9cXs523ADnz3ne1VW9/BXaDA2oYnFd1TLbb6eZnfV1t?=
 =?us-ascii?Q?l2cCEDlCq2AnBv8AuAdOJARHcjULlHRhi/CJ72+ys2JjnHY6qDpQafOEIkkb?=
 =?us-ascii?Q?Hf0o8E00V3BAcg//Qb2ctSuKOAgR79MtwxRLYAswAQ00NfRNeTFFq6wNq4DC?=
 =?us-ascii?Q?TJzu5vWybb8XBlvrBddyvB6YydTInloMNWMd7kJwe9rRbl8BDwORfs4ibc9Y?=
 =?us-ascii?Q?QjUJBov4Dv7qV+xc2M9Ea1ivKMR/VqyV8t3qvA86a1wp5fYAE2zQJkYO+O/l?=
 =?us-ascii?Q?FONMcVwGk07hUdqTrUYGAqxSpZvu1TqlsnO6dQdoCBLBsFbIVe4jszuRnRJt?=
 =?us-ascii?Q?HV2AL4mFzvW6DvcnBKKjZ3qH8P87Rdxm9apqA2EEkCDb+i8CNJyXpnGQ64Hx?=
 =?us-ascii?Q?C1jHyMnN1X+OhC58HRh1w7YA+wBiRoehfLmyZK1AQif7VDufMxkJpqGm2+Cf?=
 =?us-ascii?Q?/lyZRO4ODhwtwOhGxuARtRXq3MaiJzE2ziv7piEQ+QR2qP9HvN34WDIDrwka?=
 =?us-ascii?Q?46Xt00JZ118S38r7lM6U3sA2+xwytGkQHLsT2JVs24xBzh3wrXzTralTTKZJ?=
 =?us-ascii?Q?XacvnQoKxUYpWbcvC6RpprFYmDGQRQ2gBy2BqsA/9wnPVL1GJV/4LakzRKme?=
 =?us-ascii?Q?a9KLOehn/A77QxQ1H6WRmDZ3MIZZAcR9fm5+kuDaexOgYE7KRD0xR9iq4BFc?=
 =?us-ascii?Q?zrGakM5hsRQRV7jQNtqMCWYFjmpwBio9TlQlQjiF09Ydr2SgAwNKAK0QPxgl?=
 =?us-ascii?Q?OkO8fIbXLH9sPVen2zbDbG9lIujaQPtsuzihVNhZeeWXBfs5p3c8OdHSNDWM?=
 =?us-ascii?Q?ftOgfylYhSpsebU/UAq9QxwW+WXVvZjzzrJmLz+w4RYqkRVWpCF5OvX+Va3f?=
 =?us-ascii?Q?7eCacV5RXhUoryrO2952fPtJtXtSqMVhZkCRoBeJr1yOF3Kc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3252ff09-4584-44e2-30fc-08de3f1b7313
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:27:06.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUmN/QcnTQ/YQauVFS9n2VE6SDAffSRnr4myTulfNz3S91xSAMEfbdtVZvxGJuNyBkoj8yzUgBlhHlMoO9I6yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_082710_926900_693F0AE8 
X-CRM114-Status: GOOD (  19.96  )
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

On Fri, Dec 19, 2025 at 04:45:22PM +0200, Adrian Hunter wrote:
> The driver already uses managed resources, so convert the Device Address
> Table (DAT) bitmap allocation to use devm_bitmap_zalloc().  Remove the
> manual cleanup routine.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c   |  2 --
>  drivers/i3c/master/mipi-i3c-hci/dat.h    |  1 -
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +++--------
>  3 files changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 0d3ec674878d..c4b249fde764 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -185,8 +185,6 @@ static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
>
>  	i3c_hci_bus_disable(hci);
>  	hci->io->cleanup(hci);
> -	if (hci->cmd == &mipi_i3c_hci_cmd_v1)
> -		mipi_i3c_hci_dat_v1.cleanup(hci);
>  }
>
>  void mipi_i3c_hci_resume(struct i3c_hci *hci)
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
> index 1f0f345c3daf..5277c65fc601 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
> @@ -17,7 +17,6 @@
>
>  struct hci_dat_ops {
>  	int (*init)(struct i3c_hci *hci);
> -	void (*cleanup)(struct i3c_hci *hci);
>  	int (*alloc_entry)(struct i3c_hci *hci);
>  	void (*free_entry)(struct i3c_hci *hci, unsigned int dat_idx);
>  	void (*set_dynamic_addr)(struct i3c_hci *hci, unsigned int dat_idx, u8 addr);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index cc5d2deb23ab..c60ef5d77ca3 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -55,8 +55,10 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
>  	}
>
>  	if (!hci->DAT_data) {
> +		struct device *dev = hci->master.dev.parent;
> +
>  		/* use a bitmap for faster free slot search */
> -		hci->DAT_data = bitmap_zalloc(hci->DAT_entries, GFP_KERNEL);
> +		hci->DAT_data = devm_bitmap_zalloc(dev, hci->DAT_entries, GFP_KERNEL);
>  		if (!hci->DAT_data)
>  			return -ENOMEM;
>
> @@ -70,12 +72,6 @@ static int hci_dat_v1_init(struct i3c_hci *hci)
>  	return 0;
>  }
>
> -static void hci_dat_v1_cleanup(struct i3c_hci *hci)
> -{
> -	bitmap_free(hci->DAT_data);
> -	hci->DAT_data = NULL;
> -}
> -
>  static int hci_dat_v1_alloc_entry(struct i3c_hci *hci)
>  {
>  	unsigned int dat_idx;
> @@ -170,7 +166,6 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
>
>  const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.init			= hci_dat_v1_init,
> -	.cleanup		= hci_dat_v1_cleanup,
>  	.alloc_entry		= hci_dat_v1_alloc_entry,
>  	.free_entry		= hci_dat_v1_free_entry,
>  	.set_dynamic_addr	= hci_dat_v1_set_dynamic_addr,
> --
> 2.51.0
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
