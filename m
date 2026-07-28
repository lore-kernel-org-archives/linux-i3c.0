Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3700C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 06:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VSVDQuNQYMRzK0OZqZXbxZqb/F7e52bBMVH8GXEO8bo=; b=zccjwxnB77qo90
	f4GhKbuOal34OOaoqy0UBok2vKbf2K9dR7234Jc50t0LU4TSJY8s5qM8jtToeBbBKNTeeUbpwANqx
	KONZ4zC9P+pkAYvthvMpezqHDP7uJ7gcjeq5EvummQjLzid2yMKCdB4en9TNJQsfNaQaFSwiCoSqY
	8A1kohT3Fc8Clq9Zs/8VdlE3Bclz6SwcSdOS3dOt+KkWRDTAEucCx+QTTAR6Hjf20Fxr9nsAFyzdn
	Uql6tXKKB27LY+4H16GDgPKP9hY0wqO2m7GXGcPmMZW0FOmvOGMruCMzJzsD1rnlumssIyVQuLA0V
	5GVKjRK6utO6YcnRlKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobLG-00000004Xrz-2m1U;
	Tue, 28 Jul 2026 06:31:06 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobLC-00000004XqU-0PJr
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 06:31:04 +0000
X-UUID: df8dddda8a4d11f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:79cd9cea-c42e-4435-b75b-ecd65a180ba5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:ac3be8f04234a7359c37a13f98c1246d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: df8dddda8a4d11f1aa26b74ffac11d73-20260728
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2032647922; Tue, 28 Jul 2026 14:30:49 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	amergnat@baylibre.com,
	tze.yee.ng@altera.com,
	adrian.ho.yin.ng@altera.com
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH] i3c: fix potential NULL dereference in send_ccc_cmd_locked
Date: Tue, 28 Jul 2026 14:30:45 +0800
Message-Id: <20260728063045.73473-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_233103_419699_EC6C85B3 
X-CRM114-Status: UNSURE (   9.20  )
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

The retry loop added in commit 02cc832191dd ("i3c: master: Validate GET
 CCC payload length and retry Direct GET once") resets payload actual_len
before each attempt. However, cmd->dests is only validated for DIRECT
CCC commands (I3C_CCC_DIRECT bit set). For broadcast commands, dests
can be NULL while ndests > 0, causing a NULL pointer dereference at
cmd->dests[i].payload.actual_len.

Fix by restricting the actual_len reset to DIRECT commands.

Fixes: 02cc832191dd ("i3c: master: Validate GET CCC payload length and retry Direct GET once")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fd3e79d10c84..21212c34c31e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1051,7 +1051,7 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 	for (attempt = 0; attempt < max_attempts; attempt++) {
 		unsigned int i;
 
-		if (cmd->rnw)
+		if (cmd->rnw && (cmd->id & I3C_CCC_DIRECT))
 			for (i = 0; i < cmd->ndests; i++)
 				cmd->dests[i].payload.actual_len = 0;
 
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
