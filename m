Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D9BC88E47
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 05:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67Ow2FRkYgjWoGbdTpPcsYeHgwmbs8pWDF0/Nu28So0=; b=GqoaPxZ07SSBn+
	d1wVTjLnwFiOMz90rdHfkGUbqWimbh67UBX9Qlhy7NG/mNEWIf7M6tXSTzSoqVVZv49M2cXh3EYZE
	BEzlh3tfr8Ixk4yorUyJ3x9rBXHZNut5AoPaZN0iL0xy+wl7lLKd8FLFghAnYAUpAWvGW5iinHXru
	z3Y51J9lNLpqcUHQzDyZXq8tIWlbxUWHsfy2ZU8gNMvzE2sjJt05ntD6IPZu0NQ+hwQI4E6mdBljt
	L0KkWxGizcMM6J3WRU7IqzRBvixCCtJpqh/nOjte/8s5lFNjTdxTzN8OlVDLMfGbr744YRhK74Xod
	bxS0aMswbC+vTSZSZgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPp-0000000Bwno-0vAo;
	Mon, 26 Jan 2026 05:45:33 +0000
Received: from mail-westusazon11010055.outbound.protection.outlook.com ([52.101.85.55] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPm-0000000BwmF-0OPa
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 05:45:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR3kC6XzVeLDL6n6osRGD2JEnuis4iK3KdsoA3FNSZyX6NeDUzF5DAYbhQrY/ZB+RFRe5Ap063mYqLofoakfZciVywlgoY598lsgTbkGJ1F4EUNZgIcYOe/dfNcJZpLOSwQNyDM9jj0QbTA70U6UIIRI+HDAM35x/E5DVBQ5qLRRGn6RPiV4IS4hKRrGPz94aSLfNOzczXjAITKMVFyOpXKQyv9S7rg/0w7Hz0j7TX3kDbkSr8rnXH8vDV1GWF+mWrK0js1LatWu+fOP8L32xAF7ufPwsBOms2t/IJmuJ2mIPb0uwo6gQahrknOBKApyE/bvLLe9Cdx/LJV6pGMOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mrxSCP5GNUc3GVEfNKC6jc5fSuH5foV5ynNYC8r1Bs=;
 b=OaHzZjFCWiXv11EGNv3eUN2Kt1Du+wk5H5jVKGvGWXtuuni4f4RPni2RbmwgUA/VqFq8643nWB4I1Ns5B9WAdhCs4tTzc3gpqm1gLFQUWyGzRo4tzKqi4YuAHi/cIyPQwSCW+0snhnA9IqXQoiO+dkem+SPwKVa2FPGLpIz6Q45fc8GAE5gnGlqZkaamMFtZmsz/d+D7xDYt6DcrSik1CB+yb4jMp6BJ7+PlxJVK2VIrpfqx9liea2VoBL+QnHU22DMWB2iqrjEvrvGv9SFo27+D8y2tZHxHAzjd5uzKJmtUtary6cj74dW3mkOa9KF8BS/z2FfG3es9d/vGyBDBZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mrxSCP5GNUc3GVEfNKC6jc5fSuH5foV5ynNYC8r1Bs=;
 b=DF3KaYceP3EO2s1Kz8ar62RShMfaBn4DOgdlFtqdNgGql68TXRBqQVbK15O8uP85CYqjp/B6alyYXhpgjwnWyn/CWPTO9ceiyqFGyHMjUPYqWe8BzEsisdVJGlmmp8xof4EEzX4R7ocM5Sz4xT/ojlR20ycVCrpXihv+89uDtY4LegIdwmqwheP8Cfd5bYrUHkQVJfVoG1S2tscGVJ0jfR1BihZyJ2oN9lgHyGO4vSbYtMYyhORWw58FVxzkYVNiSsFizscIN1qg5EFZpA+UiMHf9Lo/EGxVKrmgpk+vwOo9rlDfz1jKT3bZxHbgeQZfiXVzfboj63X4oEinhfcLLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV9PR03MB8415.namprd03.prod.outlook.com (2603:10b6:408:365::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 05:45:21 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 05:45:21 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 1/2] i3c: dw-i3c-master: convert spinlock usage to scoped guards
Date: Mon, 26 Jan 2026 13:42:22 +0800
Message-ID: <d66cba213fccdf447d9410f5b80ca37aeeada429.1769404925.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1769404925.git.adrianhoyin.ng@altera.com>
References: <cover.1769404925.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV9PR03MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc8574d-015f-451e-4980-08de5c9e183f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4LfNh/jKtIR/r8V9I54WfxD+UbeR4UcDivHM6FBoqTYCxF0/4SqC93af+MrL?=
 =?us-ascii?Q?UmVAg+buLkXIY/6Fc640ZHYGcylcvGJpUfH48xdSTGPytTyMTiFVXtmoTKXs?=
 =?us-ascii?Q?+bcxUWJv1cs1ggaMdOQhkngxu2o3owCHmENfnMYGBKuCw7iVUbmDz4PrHMk4?=
 =?us-ascii?Q?yGAQhtY8Vc5GktB4t27OJSIJO/OKQ/dewvhhFPuf6HC+PXnZsqTcmyJOBRHx?=
 =?us-ascii?Q?iceVV5sdf/jfpfIII8/rGhrbr+D8hG8yKtCoUKT76Zy84tsDt47K8COAKZSs?=
 =?us-ascii?Q?fKq2LHi8LQ1GhcTiHhJzEwHZoZ7PaOXJEellKY8nFE0B1+30xiqk5jGvXZp/?=
 =?us-ascii?Q?nPS/+VVAz/AM4P45ulTb5v2S2JPvuwdokvIzPhwRDFWp70yvUMC/0kyngewF?=
 =?us-ascii?Q?tUdXhDcicDU7QECRVnggghZrOlv+agMGVtiEdEkNbVbft5bTWAp9dCQjRXH6?=
 =?us-ascii?Q?E8sxYOyFjWWjeCmPUApFpRlRSXy4XJRunMsJuGzzWD4o+SJ5HSVfw8YLETKN?=
 =?us-ascii?Q?ny+Eahhx4QqblZoOHyFvbBZEKvI2o/D1fCpk0inQ2NTHY9Af+07e44T6Ep61?=
 =?us-ascii?Q?55cGZYTtRu3aRZLj2OdFpF0bYrSfAQNHCOCdXHDZpSsSCMfqM2B9DwEPLpEW?=
 =?us-ascii?Q?SG/XzmLVwcx69y5T/s0+SKZ3phyz/tcYc4AalPz+kTH29OGteY9Hj1Ml+UJp?=
 =?us-ascii?Q?OD72Z1/jUB3KE5G6NgNblZAVliPwLcsJn6a7iPVO6bKwhxDVsKJCWfpI6djN?=
 =?us-ascii?Q?kyiVcE8SjiDJah10QPDpIKzTpWkfCnaeij2SAkxaGM49TAljtZnkQnDS1+/C?=
 =?us-ascii?Q?86qhFmSfuASr1gmyl7Zp92dPVkUzcHH78BANOFkVCRqKtxbOeiX+Uj4iKPI9?=
 =?us-ascii?Q?WdCP7Bgafj+MlExw1GkYeCLNnjymRMb3ECqk8j/009fL9fKkPOiBw1684ozz?=
 =?us-ascii?Q?Kf+x+0zCpgALGgWbtM8QEOfQDF7PnQdik1+omv1Sstf/PmiJylVQK1vU9nba?=
 =?us-ascii?Q?Z7Vk/ILTFmIQcZTyyF8Qrw1ERPVbZqEfb6w/VJDlFGdQC84V5oWCZbXSqU77?=
 =?us-ascii?Q?0gijVLKWHbqeIFqjK9DZYTRf48sWcYr1bMJqKxQCWy0n5OHwc/D4KQf8rV62?=
 =?us-ascii?Q?BNu7dXwhx913n+oMrrrZtepL2gW3s8+ujgb0ZzIqwku5SCV6jojcM5N3vJU/?=
 =?us-ascii?Q?PvM9EEQ1r7m2mwr9lvmML8AMCOJEm+6g3SemBrOji4RdBeagm6JLy1R5WPTy?=
 =?us-ascii?Q?MuVYtF8/mENnl2QLjknk4V7hu4keuTVIBDnuEz/BhmFejDG60QCi3Qm597wZ?=
 =?us-ascii?Q?1zM5TzfxGQhGqn8Q3Oy8yv6VzsHa3F1USbQFbzb9x7VS9vkbHy1yNSkhIrgl?=
 =?us-ascii?Q?LKerp2rYlaPnVPqVwXJhoXvNhxRmo31EJFRTAjItyX5ix6IUkfCXJ+FhsraR?=
 =?us-ascii?Q?aS0xvUtiEo9BEA5CwiUeBKIzfZawlpwnJ2GJVhVPmyo6vYW09HgWfqxBL5dr?=
 =?us-ascii?Q?6aC4irWAZBRz7pTGWtTNi4wZVhenOIlu+Dk87e/TUWrpgXMOJ9cGY4kOTrAh?=
 =?us-ascii?Q?nKlaYCLbQ1816IHO/x8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciU6I2qBa4ag/to2kG0zCQFWwgb+7e8UO0rXenY5WjEafGg+NUmu+qmfgSDB?=
 =?us-ascii?Q?I2hbD7WNToUJpbjwxDXF3U2eMFY0Lo+hFMjR7jPF2V6mUsOSqpa4R6qbM5t4?=
 =?us-ascii?Q?vzDspxb9CKfs+fYtzrkwiruna668KTeG4hokN9X3ZpQY031UuZyZWAWKriCg?=
 =?us-ascii?Q?hoT0PRYjKhv1bqLzz7FSl7DGsgiiJRey9wiT66X9HdNazdPyytCnvJwaE9Ct?=
 =?us-ascii?Q?+RAa202QF3uTKnXczTS0mwBR4bQ7gsN8R80oXXWlaUTZ9UP0J/szh5FFtAMb?=
 =?us-ascii?Q?EZxOkSWZ9WeETABlZH8xeukeBaJdZfTO0yi7zcqOaoDliFrumfezzYYNZf+O?=
 =?us-ascii?Q?JTJ8zhoTYDdIudkzg46NK8v9mc49VRgP9hGKqh6dKZ4TrRfvzM3tXZ7FdQVb?=
 =?us-ascii?Q?ndkXtVgaD7lSEba+3hzhPOVZ068ZFJxiQVyST4X1onsfckawIlMLWfM99nr0?=
 =?us-ascii?Q?JznRYMt4OrdrS6mV6F4sHsYqXpXGqkuBC/iD8dBeOenSF+dpDqqBdksVdKnX?=
 =?us-ascii?Q?FCXIOpXYu6JJDTmC2ODj0Ez2Y/ZkDuCMcjLLaQ6ZD2dqN0x0DXk+GHtG8AD6?=
 =?us-ascii?Q?V77grdVSFtUstNkgSC0MneX1FNnajOTtoj6b+b3DtRu3G6RPh5bDYBMkY4ay?=
 =?us-ascii?Q?lzoaff45Qg4d1h2YcUrOFnA4M2qB+8OmEl0wz0K8Y8KZ8ntggQxo5VLPP7HE?=
 =?us-ascii?Q?EkuvNbSUka+zE4WGUH49YMHJsTU3aRGDeWdyRJ7bK47kvyjfhAs9t/jRXg0D?=
 =?us-ascii?Q?4eV0wPwT0r1yFvMh488jTorsvqgDeadHdjy3YqMGyS1NuFPRgrkHlGIwtfeb?=
 =?us-ascii?Q?Cl7CAhscd++JjzMiX0tsLvmOwTa2rGblH/++7NT+c+YeBBaD54XbfoCiADPC?=
 =?us-ascii?Q?ycW/w9X9AY5kPEgZmtloJ7nWqB92OBtHt5QHycV7xX6DUbLprUmiSA9XUstD?=
 =?us-ascii?Q?zf22Xs3LtbOh8fTAH/jZx4RLxOXDp1H1U/dQ4uSgfIf4/EPpsk7KThvo5gxG?=
 =?us-ascii?Q?RximvQk6TXonVaWA+7LAcueN2KIhl+T6sGMmW+bRrLat53QTcbOeTaDEkgqT?=
 =?us-ascii?Q?J9SrwqONuSq/N5SXx9Q9HF532aIlMB1tywJqLlJMSGk2KrRYdkOcgPuuGRI7?=
 =?us-ascii?Q?raOLjB2muPmLs4tQ4lYw/y98KOei3BilMHlZUxfCBERycxkSej+ut8lPsZgq?=
 =?us-ascii?Q?FblIJwiUDnIYv2sTlrxPXDcKqDKFr1rBzhvBtueDdeUvrhFTQzMqlysHOuTs?=
 =?us-ascii?Q?sbtBnIA1YmXFyeFRzbBSPWXC1bea2AOPq0Ql33JxmqvTZxDBI2nCZQx1xf9V?=
 =?us-ascii?Q?61nw3CDaVlFR+mOXnJcvcxKTi48n3IfwGM004RN1Rhd1xuuTaAULPc9BTZZ2?=
 =?us-ascii?Q?vNXLEdFmVeGA9/xKuT8SPn778pNvbbqnlOqS66GdyRluqWJIzvfxnf/Ka/1I?=
 =?us-ascii?Q?kh5LZlO0xuSNIOUuiUqv277pdNTxu6wWqDuGp+9SZhSaEIeyz9f4lWQ38HxZ?=
 =?us-ascii?Q?UGLYDBQw02K3iQaI21hjjh4M+uphiPfKXyAoh+IvYAZbE6T7stNHpiN3KMoB?=
 =?us-ascii?Q?p7XVrHcYURT6U/3UoZl+zBa3dMqHfwAGz86zq3jYFOLKi1fJfFHPVMbDDZEw?=
 =?us-ascii?Q?DaZDzpVCa011MnjB0NiMlsMDq0kQx4kAuN/V+MA2i859j32GKakC7iUegilZ?=
 =?us-ascii?Q?ohf2ur/xfRNbqzI7OXrBH93Q+tpNpksn7d6qk3lPkQe/OZ2T3l5Odw2XMWwT?=
 =?us-ascii?Q?tXo30LrXPYYMXUDKWng2g9BI/1wGnP4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc8574d-015f-451e-4980-08de5c9e183f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 05:45:21.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwNpFF6CCNuaOCcjWgfP41Baz5HeGeS8C9LIzCKhY3ZuDUVgV5htaWEfnkTrp/oFCnX3EVo/O+c9KFcHdHlb/eeGNsXboA0Bv3/MCDEKxMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_214530_138522_8B605538 
X-CRM114-Status: GOOD (  11.27  )
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

Convert dw-i3c-master to use scoped spinlock guards in place of
open-coded spin_lock_irqsave()/spin_unlock_irqrestore() pairs to ensure
locks are always safely released on scope exit.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 34 +++++++-----------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 48af00659e19..ef8a38620e0e 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -416,17 +416,14 @@ static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
 static void dw_i3c_master_enqueue_xfer(struct dw_i3c_master *master,
 				       struct dw_i3c_xfer *xfer)
 {
-	unsigned long flags;
-
 	init_completion(&xfer->comp);
-	spin_lock_irqsave(&master->xferqueue.lock, flags);
+	guard(spinlock_irqsave)(&master->xferqueue.lock);
 	if (master->xferqueue.cur) {
 		list_add_tail(&xfer->node, &master->xferqueue.list);
 	} else {
 		master->xferqueue.cur = xfer;
 		dw_i3c_master_start_xfer_locked(master);
 	}
-	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
 static void dw_i3c_master_dequeue_xfer_locked(struct dw_i3c_master *master,
@@ -451,11 +448,8 @@ static void dw_i3c_master_dequeue_xfer_locked(struct dw_i3c_master *master,
 static void dw_i3c_master_dequeue_xfer(struct dw_i3c_master *master,
 				       struct dw_i3c_xfer *xfer)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&master->xferqueue.lock, flags);
+	guard(spinlock_irqsave)(&master->xferqueue.lock);
 	dw_i3c_master_dequeue_xfer_locked(master, xfer);
-	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
 static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
@@ -1194,15 +1188,13 @@ static int dw_i3c_master_request_ibi(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	unsigned long flags;
 
 	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
 	if (IS_ERR(data->ibi_pool))
 		return PTR_ERR(data->ibi_pool);
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	master->devs[data->index].ibi_dev = dev;
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 
 	return 0;
 }
@@ -1212,11 +1204,10 @@ static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	unsigned long flags;
 
-	spin_lock_irqsave(&master->devs_lock, flags);
-	master->devs[data->index].ibi_dev = NULL;
-	spin_unlock_irqrestore(&master->devs_lock, flags);
+	scoped_guard(spinlock_irqsave, &master->devs_lock) {
+		master->devs[data->index].ibi_dev = NULL;
+	}
 
 	i3c_generic_ibi_free_pool(data->ibi_pool);
 	data->ibi_pool = NULL;
@@ -1243,13 +1234,12 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 					  struct i3c_dev_desc *dev,
 					  u8 idx, bool enable)
 {
-	unsigned long flags;
 	u32 dat_entry, reg;
 	bool global;
 
 	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	reg = readl(master->regs + dat_entry);
 	if (enable) {
 		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
@@ -1274,9 +1264,6 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	if (global)
 		dw_i3c_master_enable_sir_signal(master, enable);
-
-
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
 
 static int dw_i3c_master_enable_hotjoin(struct i3c_master_controller *m)
@@ -1377,7 +1364,6 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	struct dw_i3c_i2c_dev_data *data;
 	struct i3c_ibi_slot *slot;
 	struct i3c_dev_desc *dev;
-	unsigned long flags;
 	u8 addr, len;
 	int idx;
 
@@ -1395,7 +1381,7 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	 * a new platform op to validate it.
 	 */
 
-	spin_lock_irqsave(&master->devs_lock, flags);
+	guard(spinlock_irqsave)(&master->devs_lock);
 	idx = dw_i3c_master_get_addr_pos(master, addr);
 	if (idx < 0) {
 		dev_dbg_ratelimited(&master->base.dev,
@@ -1431,14 +1417,10 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
 	}
 	i3c_master_queue_ibi(dev, slot);
 
-	spin_unlock_irqrestore(&master->devs_lock, flags);
-
 	return;
 
 err_drain:
 	dw_i3c_master_drain_ibi_queue(master, len);
-
-	spin_unlock_irqrestore(&master->devs_lock, flags);
 }
 
 /* "ibis": referring to In-Band Interrupts, and not
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
