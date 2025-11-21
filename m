Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913EDCFA47A
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 06:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnuIqKB9/bKRXX1CKiqvGNw+syUV9UdD3le4uqBinaI=; b=PQ83F28bRM8XrK
	0SGfAQH4goBHpmGmgaOq5JDcr6Hx2pES2tgKEpwrAeLVTBJLgXJTHyLEo9GY6ziYibcf0VB5NhG/v
	4/1YNgs6QRo2cVvmC1oQuPqZfwIXe1N2SPYHR3wrFkbjxwncSvEVtcWGo3gLsu2fwNENQvgnafsb+
	8xc0IY1C4Ig+8uPto1lb7Qhi8s+ga5Zua6ENP4jW5oN7U2we16nr6jCqRrcl2pCVeI7itQatqneqZ
	uEj64FexQCGd0okk8ox5948lluv2Xr02AnTB+mWFzxq9t/sG1NSX3CzDBYDacO8FUGk6Do/IJOMN8
	STPgqH9i6wGSrtt2/sGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZO-00000007uRD-04BS;
	Fri, 21 Nov 2025 06:24:34 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZL-00000007uOz-0I27
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 06:24:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP6Ands/iZEjlJffXUFA3AAzadtmP/YxFpvaECskN4WWx02+OyhmjBQ+8V3tCrPeL6882gjWXIVu2QJEyCLbqb71RwxKWnTtOdQHI1nJyeM3+Rg/YZ3F7CO1TgG9N1fijbDMuscbJNxxC9+A7YQOpv0DxAOgXpSteBiIOIkNL9GS1L+yBhxmSNVYm7bm3YZAcrjpYg2eNW1yMZwhOwFunIV9bF9OZvcWTYvQJo+7FG0sgP20boEgAzduOdtHoMmraylWckpCKGqwxoc9jJWsR8GO5ZKuLEcrfcQLHh/qO4fsVXk5PxBEP+xtdh3S9ZMw7/pAULewdupJ6NlU8cN0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eth3QG4ofSTsbF1v5tlhhwYDNhs/tSjz9S828lDqUvg=;
 b=j2AHle9EmjLnoV1wma1WtJofQgECa09PB2wWEVTy+WA61EcMp8FjDJFG8UlJmw18w5FTDW2EHu9Xoy8LmieslW+0DDPHVM0eInuYoQ44vlOFRJKyaW2K/u8KI5R18Fj74woynl6uzRYiebwPf0x/dfGZYOZ1XKET3gPkxBheYo8qNhVxYdxdalVKBptgOoQnPRcBAoUKS8dT/H8DoZ1rSzXOboFH5CDfQgAMzmoT4QDuwMYUKWDzlGPzdFjXFIUv8YYe9rTtVlHTVJi/o2TMeDMFGz5lksKo7Vq7BkvFjT21oHrZkD+Yxz9IlHTrNTNblzKmcMtSfu9husstJsX1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eth3QG4ofSTsbF1v5tlhhwYDNhs/tSjz9S828lDqUvg=;
 b=Bw4xSq7PJjmBWWxoe168OgOOB2/3tkOFbl8KS+iJP5GQqrlGtbEUTWT2k5Vjyea2oyaefrT7OWx4SjzXirhNxiqoOxyqOiSimjC/jfZXE5dRUwv7u10XNSvY30X6cgtKJeBtL4TuOpede3shlJ4Vgc8vtbppPO8dvFR5xvO6/XjoqedwSPCtHdGP3+XVyyH9nNqMIGAhztORTIHNnLFIVAy3R/aBuHgdZtzAucs+XgW1KT5GM6WyVvseH+/UTj/BDveaWrqPvnnWd8qlMUrZC1Mn/NRZZddK63OR0ZK637lvuXks9+hSnSyYCH/k3mqhM8vt5nYGnM5B4pd08knCGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by SA6PR03MB7613.namprd03.prod.outlook.com (2603:10b6:806:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 06:24:25 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 06:24:25 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 2/3] i3c: dw: Add sysfs support for Device NACK Retry count
Date: Fri, 21 Nov 2025 14:21:49 +0800
Message-ID: <12309bfeaa271d0b008989b323ddbd7587849066.1763703573.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1763703573.git.adrianhoyin.ng@altera.com>
References: <cover.1763703573.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0073.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::19) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|SA6PR03MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: eac463c2-18f2-4a1c-6cd5-08de28c69e16
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fakISpcjX8BGjPK0x2QCzFv+fuFZ4Ubue2bWd1ZGzDwGi5vTA0O1VLRFuyN5?=
 =?us-ascii?Q?8osqPqnpEJl8lIgBCsbuHZuSPztEIdIBf5LoQgwj/hn68U0c0dmo999q1SOz?=
 =?us-ascii?Q?8QzrAaLXUv5M6FkqyCzkubeOWNDlEtOmUygcxOuKmGWIndfH0/3P2iOYTrxG?=
 =?us-ascii?Q?hdPXUYC22iri4Tl7vwz2IkssqDJUTcR5hfHowsa+N7tO4mSX0d6y8i5LWpvr?=
 =?us-ascii?Q?qegDdDNHV5lE+nJAzGTHPRd0dvPOe1diCDq/yVCMikoBpsK9UhhjLbeAAiBb?=
 =?us-ascii?Q?4MKieKT097Iz0ZWHoD48HwMNd3pTUkVAjzFlLzOZXcB3UrdL5mJRisI9ks1C?=
 =?us-ascii?Q?tp5bCF8sJLX3ZeGovdwb3YYyvDzrUNF/G3YF6W/wor50ggGPo9+biizxCeV8?=
 =?us-ascii?Q?cHpg+DJeDYIQIyaOrbACS83ClE1a7HZztqMla3/xYa37wLAUf2vvYh9ST6lD?=
 =?us-ascii?Q?mrEfu7FdjxhBuiN3boPeZ+9OzP6t6Q44pOwQ/OiMUOHuGnZCsS5KQOfcGjqU?=
 =?us-ascii?Q?AOU4DqdaOjTGJ7XM3v6LYAgJh/msIcEX6vpYV5CHAg50Estpy8j+ooe3JQ6/?=
 =?us-ascii?Q?8qOGSY7fL71UYWuPDq37ekME4ug3MLwXF+FRclPaG69h6tMm7cYquNgEhbA5?=
 =?us-ascii?Q?DNpJiLc+2MVL557L8OWHQypu1+oJOXA1FRbDOWKdUFVgH+2FPgtEUxxnCbcf?=
 =?us-ascii?Q?ZpwaeOQwZ6AYzlGgMmEYiaJDvN3Va4iZ33jx0TziheSABNmDmqv/xwndYyUV?=
 =?us-ascii?Q?yrPzW61xJDgSwiNy/vY0ym+4lRsEeKjNWSymGdS4fr7jyAfU11tyJAEAiSY6?=
 =?us-ascii?Q?R3RpgwCkP3ONN0aguRKjWp+2x0dKdqQIjKDm/2OsJu7So4j/zLt3wf09C3Cb?=
 =?us-ascii?Q?VG0hJn2U3bKbwJDigE9usFXWh7v4VqBUcMsz0FflgD9jEiRwR8gUhyYO0UVh?=
 =?us-ascii?Q?lV3+qwugG/qWqrbrk6N/iXajQAzsGCBk9U/zcQcTxs7hjbJeNUuYhJwJQihk?=
 =?us-ascii?Q?umGuHE53D8zZI5mxNS35ycnwP0MF2x4EbKkysC9gPC9lZ1hUOUkGvHa8GsJx?=
 =?us-ascii?Q?SNvG94TDHt7H77WE7T3FbPcvE0rA9R2UbBnSvaxSwW5adwc2HllyP48evQ+R?=
 =?us-ascii?Q?8ffPaxlLk/Y8VOLY1sbAX/Wl6TvWHnFd2GxTbuUGa2jKLL1QblyMWdWMYDe3?=
 =?us-ascii?Q?CB4+fKTaIGHStpPqKr1MrNYhV/tw6u/vARBtIlIHmxnbHWOd9u6vUlPp6chJ?=
 =?us-ascii?Q?0KhOoKyRvcr/ldj5c82Ppdvz4p5q4+hVS5EGjI/AogVRqBrDdd6JHcT4DFz1?=
 =?us-ascii?Q?F6w8cqBRxoD0bf34x3HPlyeiKbzB8mN5L2OKLdwpI6lmo9Jwd+dRl4B1m7OD?=
 =?us-ascii?Q?s8k2OxLiPig5MliGM3Xg3ZEN6+imyILJMc8xRSdNCeSNTUCb627Y5TM0aSYv?=
 =?us-ascii?Q?Nup6f+Tf5ZGuZQ3p62PF6hMqU7brEfSQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/JkueqGmUWW99yUwxO9FRh1YFpKM5XMORFDLrPTrhKUAdd4QA8MyyxV5q6HW?=
 =?us-ascii?Q?wmewHFIbNdTwyfpGoRJcD3Ocb6EMwCH67PcsLovL65eSsELN2mNq7vIh5k4T?=
 =?us-ascii?Q?sLxcM3r1Ea+z4OtX7V79JTrmeECZe3GlkUYal6Kk9G3oXXHty9T+5bvukTVY?=
 =?us-ascii?Q?mg56TzRa25fCaYbIFuYWznFuFOhwVv8r+f4E9AC58nPBOP6Q5ue9v4qylSI4?=
 =?us-ascii?Q?WI0OLkAD8/JCHpHB+b7xk5nemINaF5uNnwcBE6WCcHgI+uqvfJSnj/EH93F8?=
 =?us-ascii?Q?fJKLCDHPTSjA7LGR14wy0u8efsyUNmzYxt7kg/gTqWP20I/96sKYkpfx5xGQ?=
 =?us-ascii?Q?UZbFHpdtgdoromjh/MjmVDLPjrPKLO8Z/lYyGxBvMuPYEDtsHQ76gJ2bdryd?=
 =?us-ascii?Q?D7AjCCASrrtpBTPNirQkMCAV6WWxH2MZfvz7UOZH0t/ACt5iaeCW6B8PHy92?=
 =?us-ascii?Q?i4TBjjPKlyWc+aLsr4yHhVJWxtrzpqehnnODseX3Fxoiz/Sa6pDUiLTJNfvl?=
 =?us-ascii?Q?PXt5kVh7z0wXfyjWiZIBcb5Xsqda2Cw11FwSckL5JVvksFSHffcY0jWhfhaA?=
 =?us-ascii?Q?7pvvDHL2r3OZs+8Yo8J7MJc8pS/g/xIm9dm3qYJdUnYmofJX2TiipmMvHfuy?=
 =?us-ascii?Q?+N+e3/SJ/fa4yzoMlJYnjYVj3n2lSJxJyAsRhdrRoCS/3cvrwMWmcOb+x673?=
 =?us-ascii?Q?sXDd1qYLKl2XePCiXlEVbdgcb/A4M0EYdoPgJvVOzfYDTjtFzLbUKsouUjV9?=
 =?us-ascii?Q?DVsBVtQewABmC0DzAulsE7Uo7SoQM+S4wgnOTBLzOw8ErwbtO2uvT4nnBlQr?=
 =?us-ascii?Q?If6paOG+OUE0IvxdfZ/0mpQogQvqu8JV8TV7bzWjbpBV0JuHOdCnq0n+t7xN?=
 =?us-ascii?Q?wyvNMp/F1yVsFMSIaR2B+opNT/B/cv6C86my5MLdaHkeiIruFaApljiTScvb?=
 =?us-ascii?Q?EifqGKkd39h42YqOBq5tjKUDkNpqNpwRTcnYyYTfhWqUvoiUAsAZifcKjl0S?=
 =?us-ascii?Q?GDEM51pYKzxMKJDyxS5eKG7P7xdP9ru+VvvbsBioeweWfrkOo+IfBLumKqqP?=
 =?us-ascii?Q?ycR5UXVxZtJ90drOOi/20ioXQ3I++KZ9asqjR447fRLK0b02Gq+id+6PXiw5?=
 =?us-ascii?Q?SV2zv0ndI6kCiX6gulCqFWCRKOMf+zpsC8s0B/5cGjs2jx27TNMTGpHuvoo9?=
 =?us-ascii?Q?YVTwQuxK8l+zxRDcBjPWPAA+GfLd40UntycIgWv0vPPmpqRW1rYnELGiJNiW?=
 =?us-ascii?Q?MDdyrQ2BanmDqMXSVtFsq/GQ7Ttxr72hJF+ZM9obEZk9kwmTsoWtHYCa5zJJ?=
 =?us-ascii?Q?3DaFWXV9MhEDym/dYxIzqPzvAIvBvj/1RJxUVywUF/zJd4Ulg52apyvDMIy2?=
 =?us-ascii?Q?g8gayxD9FTW/+SqZ0P8+gl+jl0I0+3UmTbJeV6Azf1FRFtCoUAHvPn1wwxcy?=
 =?us-ascii?Q?Yij0pV5vMkKlUF3lQ9xKuwCDcgsxkSit2fHkfqk7d8GiHVfWTk0rn4XwNxxW?=
 =?us-ascii?Q?Pv2ADUKDKeyNEeVMKKZtGCJ8WqRdUPfsthg+prmtkn0UJ+5/j5RAyMbpuU0z?=
 =?us-ascii?Q?UKnodd7FtsHl7SUx001F8u9nysc75EbR7QLFtCUPXJHNOz7DbB8btBEOjYqw?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac463c2-18f2-4a1c-6cd5-08de28c69e16
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:24:25.5146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP+P48dPNfDecJuAqrDiKNmidYHExgJ5JYak8g3EsTJ3Ovzgi4PjC/e7n0h8iKhQiCSi9Xc0nrurMI889akCNWcpjsx2DcxU5mV9BhJ4MjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_222431_112952_A5D83453 
X-CRM114-Status: GOOD (  16.12  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

The DesignWare I3C controller supports automatically retrying transactions
when a device NACKs. This is useful for slave devices that may be
temporarily busy and not ready to respond immediately.

Adds a controller-wide sysfs attribute, dev_nack_retry_count, to read or
adjust the retry count at runtime. Writes are clamped to the hardware
maximum of 3, and the updated value is programmed into all active DAT
entries.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 64 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.h |  1 +
 2 files changed, 65 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9ceedf09c3b6..c43eba615d8a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -204,8 +204,10 @@
 #define EXTENDED_CAPABILITY		0xe8
 #define SLAVE_CONFIG			0xec
 
+#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
 #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
 #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
+#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
 #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
 #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
@@ -295,6 +297,58 @@ to_dw_i3c_master(struct i3c_master_controller *master)
 	return container_of(master, struct dw_i3c_master, base);
 }
 
+static ssize_t dev_nack_retry_count_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", master->dev_nack_retry_cnt);
+}
+
+static ssize_t dev_nack_retry_count_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct dw_i3c_master *master = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret, i;
+	u32 reg;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
+		dev_warn(dev, "Value %lu exceeds maximum %d, clamping to max\n",
+			 val, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
+		val = DW_I3C_DEV_NACK_RETRY_CNT_MAX;
+	}
+
+	master->dev_nack_retry_cnt = val;
+
+	/*
+	 * Update DAT entries for all currently attached devices.
+	 * We directly iterate through the master's device array.
+	 */
+	for (i = 0; i < master->maxdevs; i++) {
+		/* Skip free/empty slots */
+		if (master->free_pos & BIT(i))
+			continue;
+
+		reg = readl(master->regs +
+				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+		reg &= ~GENMASK(30, 29);
+		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(val);
+		writel(reg, master->regs +
+			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(dev_nack_retry_count);
+
 static void dw_i3c_master_disable(struct dw_i3c_master *master)
 {
 	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
@@ -1032,6 +1086,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
 	data->index = pos;
 	master->devs[pos].addr = dev->info.dyn_addr ? : dev->info.static_addr;
 	master->free_pos &= ~BIT(pos);
+	master->dev_nack_retry_cnt = 0;
 	i3c_dev_set_master_data(dev, data);
 
 	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
@@ -1598,6 +1653,12 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (ret)
 		goto err_disable_pm;
 
+	dev_set_drvdata(&master->base.dev, master);
+	ret = device_create_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
+	if (ret)
+		dev_warn(&master->base.dev,
+			 "Failed to create dev_nack_retry_count sysfs: %d\n", ret);
+
 	return 0;
 
 err_disable_pm:
@@ -1617,6 +1678,9 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 
+	device_remove_file(&master->base.dev, &dev_attr_dev_nack_retry_count);
+	dev_set_drvdata(&master->base.dev, NULL);
+
 	pm_runtime_disable(master->dev);
 	pm_runtime_set_suspended(master->dev);
 	pm_runtime_dont_use_autosuspend(master->dev);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index c5cb695c16ab..c87a0e87bfd9 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -51,6 +51,7 @@ struct dw_i3c_master {
 	u32 i2c_fm_timing;
 	u32 i2c_fmp_timing;
 	u32 quirks;
+	u32	dev_nack_retry_cnt;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
