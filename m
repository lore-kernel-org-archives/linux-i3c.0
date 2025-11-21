Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FE8CFA47B
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 06:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEyTOs9QesqyOhBhwEqRLGW6zZe1fBgbS+urc0mVpqA=; b=V1AJ2Yv23MaoPf
	SxxDcxWLhA2AmvatMMyS8SNjMwk0HDqpil5EtiqjcYC7x199qMvsImP1JcIScc9051vea+r1CI+Mb
	xoQVz7CCpCnvuUFJEFkjW4YZ5RJDIIYVDljuhIKilDLIzptKGZHZHLsTWaaGerc+FVaAlvqJ0ZpQ6
	9MzitWa5qoOpx9o+szekt5ja87wDFjOzt9FpO1XHrvCxohhSNTv1N05ZmwP0TlVFgxAhtIlQW9IBV
	gwuJJyJA4shO+nEwUHCh+X2afa5LGbY8zHSK+HnbFklanjvl1bGMbnnr3uKAVf+QZCnLl+XcF5Mh/
	tKwsBUjAxe1Kl1lHbCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZO-00000007uRN-1Djv;
	Fri, 21 Nov 2025 06:24:34 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKZL-00000007uQB-4B7K
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 06:24:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y37qvyL86MfjjE6mxplLTWuPwHuR8ZppFa5xTuYdH6NiL8g3Owt/9O41giVvB8na4sZCbDam7BgDyQ91eama69nS0TdODZeRH/0FYqtIqHtTR3+rcmlisi5lNHlwpl0+DI7yMNPVeew4GESlrJDzLZGnqOaxywl2P+XkgK+zJR15ys0Sus300XUj2umkcuPYpg/F/B7GPvFC0+JathdCwmybl6/GP+WqQGUmENQSVDtPR+UiIE821stHTkWZBHSQ7CD4weRmW0SlH/ukOxCub4mc4K8Em7G2Gstk6O1DTbnh2BH+Y3ed4usAAkuY1CILrZSqfG2aNd/WqxTXUaho7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/fpFhcKWtFea1qSZ0xKTt/XT6LIUAXhUuPsipmo2qA=;
 b=U890x/nXNMy4en4FPFr5e5hoBHwQq3fhBCFcDQocPNZYzz6yN5lS4ZhKJfo2OLG0X1/ulhd06so0aGqry/QQ0xKDcsEZXygu9g4PQKCOwdl3ryVxDo5X9hjJ9rv+bGWYeXoZVEXW744HIkdLwBt9sSB2ScqK6I5MKba8lXSg2fkOVmMxB1fjgg+njwFkLZTJeqF/8zliu9sEKppg/BsUws4bTEBKup2vB5JcfyUR7VZOetxoFMFhPC1Io9WhpH3+nR7blB4whcEuGL70SANbHjPUE7JxLeizQBaEXHGV4GFsRH55bYs7MolLzied6wdQSeuT4Xk8heux/srFepyWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/fpFhcKWtFea1qSZ0xKTt/XT6LIUAXhUuPsipmo2qA=;
 b=eSmbPM7/jUjIQ3XFuGveKXhRs45Pjib0ItK2ZfdCxqs9x8jL4Nh4cVk5h5wwmG2SuWyqEw/aEEk+Gl5YO5wZEGLx3LO6y+x+u5Pd5VTFBjom0oaTbP1fSZ4HmqztDcsT/NUl+37UrsPN68kHudsiKpmH0+D0fYRUoaihLutBdPIKFLlaAfUvVFTJ3OiW5oFwFZ5n7FeCnveINtdvmH736HVkGd/qivPFKzqRovJgSLAbBcL23Zhy0P9CMpvp0nM5CNRS/T5d21pKLquCaASzCdwcGBSlaRH5N+5ILeOJ4JDvSIZjDDbEBbk4AvhGPl6CQu3vBYVJAfyAABRz7CtXuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by SA6PR03MB7784.namprd03.prod.outlook.com (2603:10b6:806:43c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 06:24:27 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 06:24:27 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 3/3] i3c: dw: Preserve DAT entry bits when restoring addresses
Date: Fri, 21 Nov 2025 14:21:50 +0800
Message-ID: <63e1b42ad7b3ce32f266aea7814304123bad151c.1763703573.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1763703573.git.adrianhoyin.ng@altera.com>
References: <cover.1763703573.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0073.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::19) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|SA6PR03MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 987aded2-2d82-455e-556c-08de28c69f29
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rUt6Ehoe3pAMPkzPTdi5pffjX8SgXx54t6QCUOmmZSd7L/e15xHpRqe3DPiK?=
 =?us-ascii?Q?ZhkaCa4QOrIR6hi6GkirHkipUlFP1JEf+9ITc9oUyR5QtryW2N9YUVCmAG37?=
 =?us-ascii?Q?QF/P45ktSqlFygAyFWB5bPda67RcRsv0m4FBY4j0SFCoQF4WiyLiLqiCzhEp?=
 =?us-ascii?Q?7UiujrUrfJTnXtI2xKudwfEIvb+s0oSDgI71Br7JlplF32ueYGzu+R0fknWc?=
 =?us-ascii?Q?KZGkFaBr1xIYkBkjrU7yNR9zIFu6scsBRhDvlLpizxfHYEFGIMDqiDjJv0cu?=
 =?us-ascii?Q?ua9LXtsd944Ph974DYs4aU6HjEBQoSC/Hlfze7B4w/p1mNSNCUkXfvt63dck?=
 =?us-ascii?Q?fopaG9I7Wmdf3OrW+SDuEX2YtsN75/+yI5ZUZp2bVCcEVmWRLrklC/uU6FCm?=
 =?us-ascii?Q?xyKnvihVVz7jzanMt6Y3wg2M+eYoit3s3qnP/pqs4CDFD5mA3dazPggx2dDI?=
 =?us-ascii?Q?mYftjUm+k7vOt8FXK/10kA1hZa5GW8YYmKzFoC+1JB4ALeCWOp2/veSRaY2S?=
 =?us-ascii?Q?IXbp4TxFO9r2bmqwBFh4Glm7dYBQ0F+zdROnOD23PEQ6NBx6jgnvGuFpZXMu?=
 =?us-ascii?Q?gbPN3437Tf8LTGk25mIKigbrWlFB3PTqbfVbZagrYXcHVrP6GWao5qypFy9/?=
 =?us-ascii?Q?e4pXEgjIcnaRo78Bc/A4dca0Mq9N27UlVCXLBsA+1a4BER4YVx5IH7j1hDTm?=
 =?us-ascii?Q?U+3FyZ8M+ynFfJ7IbfvYlmtMIw5H6yHuB2mcPy3pKt5W4iVhcbgNxc06TlOB?=
 =?us-ascii?Q?R6GRaCf/fdY8me/TLVb2+xkIR9CLpgNkploVuQZluo1ccJ3siOvDzr9JKLqU?=
 =?us-ascii?Q?gm/9jmTnUEvVNwsnCbrjpydVu8rxu7l5fBnBpWYiZaRKPomNOIOo9OWZsybX?=
 =?us-ascii?Q?7ncYkMOmUVoxx7FM+DuoPysFFiDk/r1HDdQFp6v4KgbjCt3fwAW8jyMNyiia?=
 =?us-ascii?Q?7V2osWfE9dqpGbdyL5fCeMQ3KXzYajXJfAac3LrGXuH9OvgaOQbQtLULdcAn?=
 =?us-ascii?Q?GoLhNmm4taFDm/ctVyaGsuPKmb/x37Xg58pHl0JCMT6mpYAJgT+RmXbUtTSh?=
 =?us-ascii?Q?qXVZ9UdQ0sdhgYbRZp98MM/Otf3aqvJQXY/+6iyQ3TtfK1iT/sYRGh1nvTqo?=
 =?us-ascii?Q?DGCzlTf3TO206hhzO/e2yOg5WHo9KbpHtz4zJGaFgEB6tTtvQ2f/7GgQ50EP?=
 =?us-ascii?Q?fLk0fuXidvAmvhZfKv674rATFJhf3JXtj2dFLlNfLHGxTAbcU1XPr49TYgNH?=
 =?us-ascii?Q?Xm/BOte5uWWUHWaI+tkRY2ZU4EnT2wEStIV+xpNY2IGVMVSxwPR/NBv8T8C4?=
 =?us-ascii?Q?gDbhx5b0My++zGyoZCYb0UPPqCE1TINWN5P7GVzxOQJAmfoDYvySUUPJ51gm?=
 =?us-ascii?Q?l0gDpLwqsQpsccqA/uQoLgJd2cns5YlXK+FCghiLI+i87wV2z7LVQ8bRBDqQ?=
 =?us-ascii?Q?s0h43bc24F8ehjyJvTHRpm8cm/4LY5BJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jh+2spASyIt4O2rQmcltWJcJQ4oN+k423+a9V17jsOVnyCxVfzgoAmZqVjBK?=
 =?us-ascii?Q?RH9rWYg1s/SxJ3Av3X6kaRTXG+HdbagSmLeDA3kHCdBgKm8G3NQf7ttA4ag1?=
 =?us-ascii?Q?xQkL8EBP4fCsDp1xiXgv3OhXzE8e+kkykfHs7CfCGc8DvB2npoKewS+3j2Ak?=
 =?us-ascii?Q?iBIDJ15gx29RAxRrnXKnfqerj+mpIXjylY6YSg0cs3vcC5+VrdFtM2QsSgtl?=
 =?us-ascii?Q?uNp0wayP2fMj2yUGfBKfKyUtzBypWchfwug9HWBPFh9mcoEVao1w+oJLV/Nl?=
 =?us-ascii?Q?YgSWVwlIH18M+NVmIZZfBl+8ObDzmSPqMRBYZVXwXR4kPcLewbmmqUB/GLkG?=
 =?us-ascii?Q?tI49zzWWyfv70GwEdORiTuiMmgFyP5ZuP6uuo9dWm141IixzSxRchRjpOyQ1?=
 =?us-ascii?Q?YerJeNDg10S5g4Nj2DY9t66wXSerbq+RyZ1yR3Ag98tnQlEFS38b83ug72C4?=
 =?us-ascii?Q?sV3YDme0ZRj+XupHEy+23YNEGKhTsod015lpn8oxsYG+fmWxaaixTHh6OXuG?=
 =?us-ascii?Q?z0Q4osOisLPSZ0e/GVrXHhXD3r0X5YH/SspfhErfD6/wQvRTVKV8ol0s9W2t?=
 =?us-ascii?Q?qbbKNtCTxl7xd14pdfnHJQbywp0S5bH+cU4ICBKkUdlGA0UiYwdAPE6Ojtlq?=
 =?us-ascii?Q?+1Q2WBw+TUFEEZ5earI/ZS5nw+Ur8AAfIuXe9T2wJ3MhI+mI8+C6J7mFP6lQ?=
 =?us-ascii?Q?bLtTvNzjjjBktdHZWj/oNsstoqayaXKEeB8X/8M6MlHYoshq8ST4Ns/ayAAb?=
 =?us-ascii?Q?6UokDN+sCvjoVZduRrDRFu2e6ds1gIHZ7+dKODLcH0POgRKgw7kxzTZ9sQZh?=
 =?us-ascii?Q?bDO/4YCQtXkPAGRNrgvt3ZIXSrLpb5IltM/YflvHpjo9Ytv3ikoNlwwPkPPG?=
 =?us-ascii?Q?DTSWEYmSkTSCc/h8IO7axH8RxVJJMpaKziPdi4YIBhTVo1epm/KJpiCKgk5/?=
 =?us-ascii?Q?WVAlEViZyYBHgvHF+J12GPzDkL6bKEscWBk7fefV1Rr5uJekpe0h++KEfd0Z?=
 =?us-ascii?Q?eqY7BnY203EG4rjsClvXNf9SPo+8dhdRwVtcqMbKSUpsHgFp5Ul9BycKoXp/?=
 =?us-ascii?Q?cO5OtPvGeGFylqlAi/H3hnGM338unY1JT1w+Fq9ZtXvYG3u2LRElT4qtL80h?=
 =?us-ascii?Q?m6ftezFsqM/qDaVKNEG3p0rhk+8DjP+uRS9ZdgCorEcUK3LbfF+iX1fMUumE?=
 =?us-ascii?Q?iUCsyVJ8Ff2MdnpHt4ODXOwpyvy8ZGk3t8aHfaLBw0TtZvgMW9Rvq+isezKG?=
 =?us-ascii?Q?GyaJoJF74A36A/It+rp17wedyez77/3E7ahCNUpnMB/nhPfMdpawV5JhZcc6?=
 =?us-ascii?Q?lCGX4E7DCaGY7mCXpbOx6wZQJTo5lZkGLv8Buh8t5LQUyEr4sfqlOj2RJqm5?=
 =?us-ascii?Q?2kWiEAQwUlud5oBgjkYI+0H04/8mSAYDHVnO7Uj06GNPxY/sXDSKghAxFQ0t?=
 =?us-ascii?Q?P67dVZIRnrWxMDzQ6OnrzkfV8XnEkNDQCCp0srLPYgjzW+dTtB2590qtD/z4?=
 =?us-ascii?Q?NfwaQoLCjQCPfT5ZCuczUcdGF7ObZMKiuYOB9HUAOHushcXIh5ehA/AXED7S?=
 =?us-ascii?Q?RYRAPADrX+S87B5rGE0eQ00cbuDmVkelScyR27B2O5HgIqTPek4bc6FlZrN6?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987aded2-2d82-455e-556c-08de28c69f29
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:24:27.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMI937JH2+5Yy7sORFIqg99aKrlqCa4hqSWOEqg4/FEhR3fiaXQaA8Ila+8WZybm01RXF2C2Dty5zbokqXFBBwz0CHxp/nOxhdoaDrz4jSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_222432_037336_D21B6AEC 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

Update dw_i3c_master_restore_addrs() to preserve existing bits in each
Device Address Table (DAT) entry when restoring addresses. This prevents
overwriting configuration bits during PM runtime resumes.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index c43eba615d8a..ac3c2d3136d0 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1718,11 +1718,13 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 		if (master->free_pos & BIT(pos))
 			continue;
 
+		reg_val = readl(master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
+
 		if (master->devs[pos].is_i2c_addr)
-			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
+			reg_val |= DEV_ADDR_TABLE_LEGACY_I2C_DEV |
 			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
 		else
-			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
+			reg_val |= DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
 
 		writel(reg_val, master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
 	}
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
