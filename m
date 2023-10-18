Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83F7CDB482
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Oct 2023 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21mC/wQpetXfSGJhFbXoj2GIMoANwbp055rdxe8dAT8=; b=CXayqS7GlotDaw
	4C056bcsBSO2jKzIVBzrpfEaqDMlL1ebnjXco3E9NwBxOMrN8hvssg2InIaVJsmB0lCmvjbDzU9lB
	wS/qa0UAcPdb1xdovn59fg8wHpvUue03ox0Pnh5qKZA4WRwn5Nta1xgIfzI11Im0rpN7kuZOkJKCy
	xjUkhW04BSjL7DAOUq6mV+MjGASNvTp1z8uTzSnB1FR9KPBIaoVumebJ1fpHAL/Cz2iN8xSFJVWEd
	5HRhL5UBxCbdzR4kNiB5tWkiseKJ0nTM1wThO18Qh17hJHtG8UUKOZSY+mutr4aR9B/fkPjhuGIdP
	+w2dmQ8fwZIg9X/wAQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xi-00F7rQ-2D;
	Wed, 18 Oct 2023 15:59:58 +0000
Received: from mail-he1eur04on0630.outbound.protection.outlook.com ([2a01:111:f400:fe0d::630] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xg-00F7pR-1X
	for linux-i3c@lists.infradead.org;
	Wed, 18 Oct 2023 15:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elL22lKNDIcIEXF6ZPCFLsjYDCLaxpQNppVx2N6a3RBIVF4UeZvhD3ItFYJCvbRw3vgTMhqP0Q6/802otNoYL4ADaAm4ByYxBuihc3HtGvDmqZ/5DILLeYItNsQKcquGMgKV2QTVg5WoNVxGzpXYcdhhNNyvGrM9r9kt1NaEp3tKihmINBlg9qTStR9QeWFBrQwSp5+rZvry467k5WJdjBKm+xpsbUthXZcu5xVuDmGeqDM7ZlW4mQBmZz+YG9of1VAvx+mEqVcPRgtrhEOzBCvdThrE2Pie/B2VJ8wLoQorRY6PkQzO3ZZOaLZB0caSpPRvTVrxKRno+HqrVqs2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmA0TmfYW8MJ+DqQikfItM+khhjIvm5K1uwmiII6AZE=;
 b=cz4PARiIIuRDwocngOey09ITBe8xNFBjCZjJBFJ6RDFSGo7D1/kas/gXvZLqceIfmqxJ2dZOPikStNIGKEgkNJcDCsIFoKmJKOJZ61xJJzhEqQ61mD8AeTA6qdt495Yk8JokayY+kQImhyyxTR5/wJy5ty88yBdjeYFW9CaPFLN4a/GLpsez/vIj6oaT4tmVpVbc4fSmeGFuCLQ6IciqoOunfH0bD56gUZiIWVXKYleyZSJxyXllLYB2sgBGc0lWsAo150NID/oY2ZPPzpZm96h344mI7WjMyyroOsOvDlZGXRPHl6edr1gbSBoSHX8flUtvGq+euUWvzCIZxDlqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmA0TmfYW8MJ+DqQikfItM+khhjIvm5K1uwmiII6AZE=;
 b=bvxSrmUR7J5kYXMhtxyUEPTrZATUG92yijCVso3eeqlY30MErIQHwIzI3/3q2BK58d5A/oUpVCOBcu9qi+VWivL1AyeALYVYgVlwP60MUNeFYgFwSY0yj04GiE1mp2azEYCTkcWkh8RXAfk/di3hcX0aO660khydfgLgLOn7aaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 15:59:51 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:59:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 Resent 3/6] i3c: master: svc: fix ibi may not return mandatory data byte
Date: Wed, 18 Oct 2023 11:59:23 -0400
Message-Id: <20231018155926.3305476-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018155926.3305476-1-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1691c1-0dc5-4a3e-90dd-08dbcff342c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Om+SKY4e6UluvIO+BjGqxmdqbMDjCT7jVI4jE/w8d2/MmG8xQkZdlqNoap34MJ+8Fwaa9WEISjOGJPkrodzeU6ahV7oQXCYS3bN14f4E5Wa61t44b2/ll4VwNs7ZxwXmRDihQVoTlzuobdAXicxSteJDnuD5C2GItFkDq8eEEHnbhA89Sfr5GhnQYnsz05+eJoDrGyjhZHDN8Mf1bv42ea31T82RB8jcqx3E23Rnssc50rMpzlkuaKvvsAPDVUpAdGDKjFy55f19WDJuLlRzfJteygZHDLRgKKfey08owIgg3T+Pf4u6GUkQjGHsyk0TqyEVLUXn30narP9HMwkK4lKGOP8yIRyCarEuuah7b10ftrBCj0cRo7czA7fzjTVAfWlRT0o7PVuMsx5scVeCY9ibQ+Sg8in/+uBG1isD3bZggYBDCQwotaSyg/h+gaPJ/lHrmwclTGgPJtON5MRilSjRcqaqmk+et28ETzl1KEpGkBoyid0SVbpq+ddbxG0kOkDmmWzZyWFqczogrEgvE2GTnMkgHXYg9G0TItXLC0AecVjzdC9+UN4tiW78C3bRWc+8zHIUHxg5iwvcgp95mCARSqWsKPZaqzu1b8aLruo505mnU/7xtYIUK651/hic
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(478600001)(6486002)(6666004)(38100700002)(8936002)(5660300002)(8676002)(66556008)(4326008)(66946007)(316002)(36756003)(66476007)(6916009)(86362001)(41300700001)(6512007)(52116002)(1076003)(6506007)(2616005)(26005)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7xoQ2JldThzWaJKO6+pf7KdqgVsTvKDkjbj+pQjNDgxKvFtbpxHOnoVF0Kc?=
 =?us-ascii?Q?sgzlIix/hEW7ScyUtdpd2nArTDTU+tMT6NcYXdYSj4DCer1igSwt/ZXpcEl8?=
 =?us-ascii?Q?vq/SQYC56fXQJM5VhxQvf1WU2sNa6fzmYJZ/hHjgsK684KSl0b8gMwCYmdLM?=
 =?us-ascii?Q?2JMmMgxLbRD+dmW7zadu77toFC9IzxyYmOBrOYBrEjKxS6viSmvXLpzHE+4a?=
 =?us-ascii?Q?Zjdhpii6wi+Ttq1vk0SJu/NxmRnRc0836wH1gklr1hPTffuneaUy4x9Hrgbq?=
 =?us-ascii?Q?WJ3KRqIQKJ/ufXLeP1erd4gM1ICseduc/IEd0LwnTaZFtJYB8SJhLinbXxv7?=
 =?us-ascii?Q?i9WjEXaQWvdpAjlJ5yiwEyE0D6sSEdezqReVM7XCKznMU9QrUHG1lGkhG8ed?=
 =?us-ascii?Q?fpLFKq5eeoEj+Q0I48IAi6ZAQ+9Fi2aegZrjcuDN4onA5P6HZbL5yhHAyaSy?=
 =?us-ascii?Q?5tx/yUr/VaJdB4DB3AjAetFE9n9huFm03TtGbA8QEMnTKezbmVR28ulIhtIB?=
 =?us-ascii?Q?f+RlQZqCxvP0QwylV/GrsEAWeg36WmdP4BcpfamnwdKmG5ywxqCkbWQRSEjS?=
 =?us-ascii?Q?tDEO2C7A+L90o8mIIdHTg1Aiw1AdLEAi+aLEAGxmrmaTbDpjclEyfOjK/S+t?=
 =?us-ascii?Q?9HKGoiafJkovHRrNjpql0CpgekNs6kM8kvdfUyvDEZCbrBiqhXZkeL3EWXgp?=
 =?us-ascii?Q?5TzTaUfJhNLUQJEVflHr6QuYjmfNeBL5A5zgD6a5qPYoJCgSYjx8QyooIoIC?=
 =?us-ascii?Q?XjqNmw1nIAlO51dm8bC+S7Xj9yQNTjKOvqf+2hsnlCcLkvAeOrPBqc+yJoOf?=
 =?us-ascii?Q?kVezOrD2RDLcIQMLtVQQevp0MiEsPK2W09hrhzmu7Xux/H7nOoCLv8U3DdYh?=
 =?us-ascii?Q?inDQyxVu84AppI2u7lEA/LlF/P/2+9BOV6HwHT0h+eVBZbJVUro0k7LCekTn?=
 =?us-ascii?Q?1x5FflI/TLQMw73mevXeXkZ9RnfXGt0tcViD189GdfI70j7SNZ26I3Ynx+79?=
 =?us-ascii?Q?m/k2EYVqwGXPSOSjKY5dXQ3wispxb1DuzcMUHfct7CZdSJ4vBDFvogs0Aee4?=
 =?us-ascii?Q?Ku1qKNO3igZBmS/XeYxrwmGSS0IL4Jl98AsXjJRch5SZ3MBkgFQowvMkxqkK?=
 =?us-ascii?Q?CsDOoakPtIw7KQ0MH2BT5hpldUn3/GBZXM84RAKEgsz709iHRzXI5FFecYiY?=
 =?us-ascii?Q?PCX479xMwiBGL8N7sOYp3Z90aWgWE3O8I3WUnEKS5nriaLIdrf6gKCyYzCNP?=
 =?us-ascii?Q?BtFRlZI5cxcEucS8DrDOTv575Hw3VqAsuPfIXfXOheX2RUznX1DNg9WfBsDG?=
 =?us-ascii?Q?fID1YECPuNfTpslju91sx7vNARMeGBlMAzjk611n1QpjrgUqHZBNidPPAvEv?=
 =?us-ascii?Q?m9L4SGueBK1iyrurEtdqYMl28IJZGkW9ijG3kggGZYpu0yGxhIaM30ESpk81?=
 =?us-ascii?Q?0325UVhrCgVio08o1FgecZNGoskMgQ56KpKabADV4MbjuULLjGZyQkLOFJC6?=
 =?us-ascii?Q?hPhCffXIPBCGZ9gbrL3ZRCoyd01Kx9DIySPWXV5zk7OCZtbWmeIINKxSqbMU?=
 =?us-ascii?Q?JiRBFGQypgeqGkYFekPMvfHWqGA2wm1LUmbbz87E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1691c1-0dc5-4a3e-90dd-08dbcff342c3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:59:50.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3W1EFH5QHzMVrocEcrtO3pulaVILJ0eWgdP/2M8bMLUw6gl+DbyKW+1fUHKcx/K4/6rD9BhjYHCrRT1UpMwj1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_085956_514610_D8706936 
X-CRM114-Status: GOOD (  12.07  )
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

MSTATUS[RXPEND] is only updated after the data transfer cycle started. This
creates an issue when the I3C clock is slow, and the CPU is running fast
enough that MSTATUS[RXPEND] may not be updated when the code reach checking
point. As a result, mandatory data are being missed.

Add a wait for MSTATUS[COMPLETE] to ensure that all mandatory data is
already in FIFO.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Cc: stable@vger.kernel.org
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v1 to v2
    - update commit message
      it also works without mandatory bytes

 drivers/i3c/master/svc-i3c-master.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index abebef666b2bb..dd06b7c9333f1 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -332,6 +332,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	struct i3c_ibi_slot *slot;
 	unsigned int count;
 	u32 mdatactrl;
+	int ret, val;
 	u8 *buf;
 
 	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
@@ -341,6 +342,13 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	slot->len = 0;
 	buf = slot->data;
 
+	ret = readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, val,
+						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
+	if (ret) {
+		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
+		return ret;
+	}
+
 	while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS))  &&
 	       slot->len < SVC_I3C_FIFO_SIZE) {
 		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
