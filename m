Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A76CD98C6
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 01:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tADfXBRfZNaTLMDKqDEmvIDIVgu37f9ozDHxp3vZ2s=; b=Qkefj+b9SqC4vk
	+r3eMjyD4x/63YPjTr72vP/OtLUxdPTCjtCQW/xUNneLQ9REMwb0KQdx3VtTsibMNimQArdkTvcWe
	t7J85FpJo6OZwUfwMWY+gFzTbBmav7Pgz7BWMsA/YVk6/Dlsx4ENbMNHYzlyyicRgOWlM15G440p6
	MNjNXmatMiHAUDMI4gc43fDPVNH6QzKvm19iGOYbcswcLPzkUpfH+bqwdRei0GM+sdC+CqvDkoZJ6
	xjKP4p80iq/kOH3vkctFUPVLyeRfO+T8w9c3A0gqd9R0al2xHlhFgUJKME7q1OzZzstnE32RRiwRl
	u5QIi0xc9eOkd2ZHlg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUce-00000008XOv-2Imk;
	Thu, 11 Jun 2026 01:54:20 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUcb-00000008XNo-43Gs
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 01:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3/Q3LuXlT4hVHHEgbiuy+JIKx2QmmqQSsj2pkJXhNv7KoCrDhhcNllOiy+Bo6/rE8SBEANKfvwEB158hyQb36D6pv65tHPGn94Nah7dPG8tfr/begYCGIiqKRSvhsKoZOGEa9PHbf4j7ZMJfs/2rOcontzIPBC+1HgIt3XurtL1IKAPUrfWllDjCDkjTheZ4m5FmPjFMDMbE0+3Bhju1y33tQwiT3ZUC0smPngJZ2o6pJfn6j4f4REIMeIlDWSfN/e3F+3NQCkzA9bsISgkjKuhnZcSD31mN6F4CWefv5kItTRfD16HbjZSywQzQagmZ9+v07421boRvWYmnMiWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuj0mYMKaxPhXyxtOtN7AbWXf1zoqQK3ot/sUewpPOw=;
 b=RQ1exqDXz9y76gJsdOT0iuOl95yd9AnvgghFJtvnzIUvpXtKl4zKasC5K8/VNRJroRgSQuNbjpEPXTABjqHqVMeLU3NsqhFyFjpFFdN5wCdymFfQWBM7VC4HlO48+ALgenaRtBy5UDG5IdT20YvA5o7JZfYGdUQUsFKKi4tM0m7/RTVh81Uxg7p2aRSekc9QJtZOGY+qQqa4aBn3HUdzEXERwCdBX/3sUBdaqZn360oazRwsNMiLFQDavhslCVejygWkUq55mfDEsUg44B5JWYIyRGbc1o+ZwEXIg268tK0BVnVOh27bXf/Ym0Nq1b11MZqtj23z6heu0wayh7J/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuj0mYMKaxPhXyxtOtN7AbWXf1zoqQK3ot/sUewpPOw=;
 b=DXW9wS24cCQEvaALs5jOrKM/4R6pZaj7Hi2uQmh8il2R+KGUVaG+RST+1UpK7vADPNSqnjPxY0vA6xo7bFau+3FnUHVlMH+BVhvqrA+R1OcyrJs6e+DCwrI9ZauKcmgxemlj1dwKxzi4L2NvlrWZxBG2ZQV3PUl3KVMyOsYrFdXOLB0L/f1gxH4AAsw+lcEXrYUZUm6JZiBb1fRU/u43Ywk2HfRchNiGBRzFvSE6f/avuQ63DbRJb3YinAmv7JfubFi+stQR+8mYWwXhXx5yLL0zghrlxm1QGX++vhX30huAxt+T69t7+KY4SyoVCzEPVCziYasPxZhTEyhIReVbnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com (2603:10b6:a03:2de::13)
 by PH9PR03MB470143.namprd03.prod.outlook.com (2603:10b6:510:3ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 01:54:11 +0000
Received: from SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf]) by SJ0PR03MB5951.namprd03.prod.outlook.com
 ([fe80::f285:8376:68af:6acf%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 01:54:11 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] i3c: master: dw: Report actual GET CCC payload length on success
Date: Wed, 10 Jun 2026 18:54:06 -0700
Message-ID: <b7dff215ce161fbff18949a12442eac5d189347e.1781142158.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781142158.git.tze.yee.ng@altera.com>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To SJ0PR03MB5951.namprd03.prod.outlook.com
 (2603:10b6:a03:2de::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5951:EE_|PH9PR03MB470143:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c21647-4a01-4a5e-6f2b-08dec75c54e4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|921020|55112099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XHjZsKFxC3mi8Kg3jQxDQvYlsLFl3Ra6q3mx9g8TjLnAwxldlo7INNX+cUvNVCpwN9D09nQYyVESHfxjubp5aEvRFSVZ73ZzEM/73QS7cIZdBpVLbw/ucCwe9mpaFGBgO6Y0XsGLG80YtPPunJSWr8JBfoBhiJ9JG01bBrhO8buanisI+RtnP7lPMK91c1ewSxa7CV1nN1rIzJMj1l9lB0b5JRdPn83/GZ6s5gXLP8IZjcCAY3QJHUxnyTdPIPdVRL/K6uQ3BQPeYYJYazLgyD0p95x3NlN/LSoEoqtZiilc2hB+bve4hN1m0iz3msXLcAv+0jM9rzGu7MD+GrTp+WLBv+/hIBv5j9bq6zsPnaGsfCKXuIy6k/+nJulgMEuQn3jUFz0li04M31BlikbKeXwXmb72UPsw4j9YUx/dIHWVibo9u5zFdIzccQbbAu8Q/eS9CkC+d7vUsg3zsVl+dRaGOnQMoIAseVe3ItHBIDyJdqSPna67tv+QsLrCqauMxQcrjf3xH2GIgSmI6MfNq3gLG84h1RaeMSIZuJ1s43uhODQ9H6y3L+IBX7JOvR5flPmJgB6DLEsH4Pm4unDbQE4mQmWeCXesDmvizWx9VUA+xqRawUg0gMCvvOVdhLgMMT6TeCiyTR9INm5zeht5BqVZoSMtS7sYgCQ6V8yyHrJWBSHYV4/2W4Y3EUXRGcyv66Y2G5ZExWYwYTvBxu7jDlWGQXN3LKWULwV+UpOGBx6KyoMg2LQnXGhX4Un+IM5M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5951.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(921020)(55112099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dUSwyDe83jyggCnMmQoD/tWIYvgKKhOq9RfkPm1PXcKuTOlnzFaFGyOX9S+n?=
 =?us-ascii?Q?qGlHiSbdyWoCzB42UsqcAd+ng3BKlTegPvBwJJgQaEEvYiXAXRJE1dPArB0U?=
 =?us-ascii?Q?+oKJ6aNWcnP7vDoM87k7LzbtkpKgjbWH9MgjUgUVvNktqPEL4y85dQWnHpZF?=
 =?us-ascii?Q?fs/5E3fNyF/ezpYG8VI1DU4BgpbeW4NHSzXTEWHG3K0abMMrOFxbtWV+KRt3?=
 =?us-ascii?Q?sYng9YfoPizv3yzQrow3W8hGzD5QPhjcKUr85OC2ejknfPqm5uv5x6oAeEKc?=
 =?us-ascii?Q?2mWdmLUPWeS1EX8TAGZp0fSuuuMmMMpF0txSGrD+ECc/h1ziPDW2rgS9Wr5a?=
 =?us-ascii?Q?M5UPeIVmCerllf3KOHYPYXNuZEjT+LZ6SQCr9CoWncoSdJAqSvdwcrjKQ6Rc?=
 =?us-ascii?Q?jF/Nh3eZRnPrAcHDi2oyxmTbGgWc5SCSAa6k7LA92EAyRDXQn3HrjY3/TBrE?=
 =?us-ascii?Q?nEjdy+T9/d9rwn4smWZRQJ1wtYIMYE/b3KCvMYL5QcVZsrM0CKW4HMLQiwO/?=
 =?us-ascii?Q?cRrsnDiemj13e25Lqa6qZaMjnpkzpBYiFFu59+79VfkcJmC0ZBGt4cAY8tSM?=
 =?us-ascii?Q?w1DLvFqdRtWv8QxipAdWcneQDZhKbZGCcnb3tq0QGdAydQaC6s3qGOjMpB8b?=
 =?us-ascii?Q?s4UlTyNkBFAZfJUX1hqLgWUMEXTY7/6tccD/PJkCseE9PKR5LQ8WMX0Dzcqk?=
 =?us-ascii?Q?TTVCl/IGaWFa5bghgOEMEFF9W/wTVOIk/ApO/0pBYF8IUpshI0vTizEV0qL0?=
 =?us-ascii?Q?pudxjUW8sVflcrYy/mGPMo9d8ASliVUUkUKNAlf6rA/F/KpADrVEGNitl/BZ?=
 =?us-ascii?Q?scpJTm1TCoATy2GjeT3d7vvtUn2kWt/PymQvOG3YM/iTxCqz/MauVrVISwyi?=
 =?us-ascii?Q?TaxdeQoKk+jwQ0Dmf/SkgkqR/ADKm0nNdV6GJ9Re20MXr+VJeA0bK+/Gejnn?=
 =?us-ascii?Q?qSi/6lH5zVP7DZxqQkCY0N0wLgntttOX2IC5DvNiD97uubo4WvVonuBMQunX?=
 =?us-ascii?Q?HMWMDa38vFyq6r4hMwiXBZpVnVcCzkt3FKLFiNafrUBB46cr7snz/hHrV2ip?=
 =?us-ascii?Q?Az4V+xrxbaoi3d9MLuWQQHnSEC+L7LpS71o7oq8ABggAXjoPqwaieRe/m04+?=
 =?us-ascii?Q?IA36mVTUQA+PxcfwtymzGzTyEsEnhHcWdFnRS7RYiVAem0ruIPRK6Lrqx6eF?=
 =?us-ascii?Q?wfgPzT8bZJl3y3onIJaKvwTc1o2WA58P5LBcJZJUgxIH0ZiWsNLCDOHXsy2j?=
 =?us-ascii?Q?djVTb/5PNLN+NyUI0SH+xPe2NvGr7gGhEEI/GD24lTB9GbOkjkm8QQD7H7zC?=
 =?us-ascii?Q?xsEJrh+0QxjvZ0Vtv5Zp7Xlp5x+88703PmaiMLwmwDuOdwwCQUy8Xkpdv0tN?=
 =?us-ascii?Q?98eyykjcAvnEkIhRHn77Xt3i0MvISwNnlePbUVZteekhOvw9R5gKhNpTTPEG?=
 =?us-ascii?Q?w1r8O7XUyUIuDRYv2xoS9e4+yYGRX+bP9T8oD0mq1x9bkIr4EdYlkLuf1NFI?=
 =?us-ascii?Q?dGhhdNU0C6f3rqgZApxWT/pSTp85MaKbiLwGrRUOKuGYYcQG63wbk5Ppa+j5?=
 =?us-ascii?Q?Jl5DDQ7QgIIpKhtpKVjXYLpvD2RxE/jmuI3fjRLQ9quQ0SNRuEud/4XINtUE?=
 =?us-ascii?Q?wwknNxT2D74JKX3W3yz8yU8Uqa01/+yO4sbg0YpP03zv3G1KZdTOQQGFqw6G?=
 =?us-ascii?Q?Jw6c55CWxZlHG+z8w3W9RRXHHoES+GOtgWYpIPbyvctjk5TU5gJX98XV87J8?=
 =?us-ascii?Q?RrTDVqWgaQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c21647-4a01-4a5e-6f2b-08dec75c54e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5951.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:54:11.0648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xH+B9QIGhxLimiwpHIc+IL4BKEZrhTsWU05fXANU7Cfdi1z8pulr+Pbz9nkU5bviw2xUpdsg9enD1CP3JezOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB470143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_185418_014140_E3BAB8BC 
X-CRM114-Status: GOOD (  11.45  )
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

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

On successful GET CCC transfers, set dests[0].payload.len from
RESPONSE_PORT_DATA_LEN so the I3C core receives the number of bytes
actually read. Core helpers such as i3c_master_getmrl_locked() use
dest.payload.len after the transfer to interpret the response.

Save the requested length in a local variable before programming the
hardware so the caller's buffer size is not conflated with the bytes
received.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..06fdf8857b9c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -751,21 +751,24 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 {
 	struct dw_i3c_cmd *cmd;
+	u16 req_len;
 	int ret, pos;
 
 	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 	if (pos < 0)
 		return pos;
 
+	req_len = ccc->dests[0].payload.len;
+
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
 	if (!xfer)
 		return -ENOMEM;
 
 	cmd = xfer->cmds;
 	cmd->rx_buf = ccc->dests[0].payload.data;
-	cmd->rx_len = ccc->dests[0].payload.len;
+	cmd->rx_len = req_len;
 
-	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
+	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(req_len) |
 		      COMMAND_PORT_TRANSFER_ARG;
 
 	cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
@@ -780,7 +783,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
+	cmd = &xfer->cmds[0];
+	if (!ret)
+		ccc->dests[0].payload.len = cmd->rx_len;
+	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
 		ccc->err = I3C_ERROR_M2;
 
 	return ret;
-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
