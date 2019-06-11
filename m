Return-Path: <SRS0=yyII=UK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A090DC43218
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2019 14:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7882D206BB
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2019 14:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nr35iLSh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LsKUwIpu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7882D206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WxOUb5VmohhiJR1c6OqfYadbpQay99ZQ7zVzownDI60=; b=nr35iLShuOdB1Nv+w2ieXid3Br
	aMGXh4Gz6MBDLuuZgeMoedgTh0h45o5o60ZtSYFBJNQtyznNUIuynY6ScjaBOnHcaWjuM/TXzL43h
	IBia6YwRPL+ScUG/BCnWK8UI8P0/d5X8sdkesuyevF1oEhR9cdu0kcAoE8zDrm+bzRMXZzRHt8ZvM
	uDMGQsMXFAHJnnPrOPXYuEcOkeY9reNY0FqwqY9b0P/Ljp7MLybjiPQuYAGiw96ulnqwtN4E1JSqP
	OsYKRoH/2899Z7FxtcMNpdWRzylu0sjvwFQKjQcdwhkPgVXKNGqFGqpDZ7Ljj+RlsCQmgae/saaxG
	7OBF+Ndw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hahQN-0000pJ-MQ; Tue, 11 Jun 2019 14:06:55 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hahQL-0000o7-6i
 for linux-i3c@lists.infradead.org; Tue, 11 Jun 2019 14:06:54 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 955F2C0F51;
 Tue, 11 Jun 2019 14:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1560262007; bh=vMEPr50pYiB+tqjKzwXZ5iSJP43TFUpQmHn+ZkqTQqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=LsKUwIpu89KGiUrigsB4YtoJon18DD8SBkwfVLIUfdzAap9VT3StDmzmHjsO4VKrE
 OvXpH9yDo7xajpY4esqyciY2KEa3XXuilIa9T8MnP5ts6PWBjyk2xvFIJat57UsLPD
 5s5AvGQacagSSWN5E6gszB4RYnLRdxOZz745GJrGxFqZdV/xentrxQ1M7dWmp9wWUk
 apl3CLCy4UknQLYluQnxY+JAEJTS+YqJRzlByMgjgBi5gUUyDLBwPw07LQpHhQIBJK
 DytAzaQilB0wT/ThR0wEQIYsu6UceCdbsHjTXr2rnc+id2yItCZKsBPGCBoroc+nCw
 uVq6zczR0UYFQ==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 18F25A005C;
 Tue, 11 Jun 2019 14:06:49 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id EBD213F594;
 Tue, 11 Jun 2019 16:06:48 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v3 3/3] i3c: dw: add limited bus mode support
Date: Tue, 11 Jun 2019 16:06:45 +0200
Message-Id: <db0bc8a55c7d54d99e36226e34aefdb932c92515.1560261604.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560261604.git.vitor.soares@synopsys.com>
References: <cover.1560261604.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1560261604.git.vitor.soares@synopsys.com>
References: <cover.1560261604.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_070653_261690_CFEA6E33 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Joao.Pinto@synopsys.com, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch add limited bus mode support for DesignWare i3c master

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
---
Changes in v3:
  None

Changes in v2:
  None

 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1d83c97..9612d93 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -599,6 +599,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
+	case I3C_BUS_MODE_MIXED_LIMITED:
 		ret = dw_i2c_clk_cfg(master);
 		if (ret)
 			return ret;
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
