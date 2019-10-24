Return-Path: <SRS0=E2Zs=YY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370B9C47E49
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2019 10:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D689B20873
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2019 10:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qpb90SZ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D689B20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pYULyT7UIx17ojkprO3cNaF8AB7V8QdiLXAWdnzwAbg=; b=Qpb
	90SZ1WEg0E6aNNDXkzscYJe38Ags7jTSTP3vpS9kHOdFlnrEcRvYRuwRyN6xVjVhyxPm7ZyMYdYwR
	WSoiMz53/Ipmpm6NeJ4jPhFzRCqGdGHz2UK6WEi4SZ8NIorbxA9HZlA3avBV+cbcmTkNX23ZTjZl7
	dIv6TGc1beot4yzFn0ZLSf/cppJ5tHwD3CWBhcaUsKhzNFStGz1+mbReANhzKeEtIGk9j51jOXvRY
	Q5lWwOG0sBO0p8HUL2ylXG++8ftuIFd4YR3uYjAZpdf0XNbQens3LhMRCQ06HC9afPb0jL3Xnt6e8
	VawvU4GLr/ueO3pi0XYHNWBsKDSUHIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ7cf-0001GE-H0; Thu, 31 Oct 2019 10:24:09 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNetG-0004Tf-Da
 for linux-i3c@lists.infradead.org; Thu, 24 Oct 2019 15:19:08 +0000
Received: from ramsan ([84.195.182.253]) by laurent.telenet-ops.be with bizsmtp
 id HTK22100Y5USYZQ01TK26f; Thu, 24 Oct 2019 17:19:02 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNetC-0006zB-IB; Thu, 24 Oct 2019 17:19:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNetC-0007hC-Gd; Thu, 24 Oct 2019 17:19:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Boris Brezillon <bbrezillon@kernel.org>, Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial] i3c: Spelling s/dicovered/discovered/
Date: Thu, 24 Oct 2019 17:19:01 +0200
Message-Id: <20191024151901.29519-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_081906_652275_B76584A1 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 31 Oct 2019 03:24:08 -0700
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
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Fix misspellings of "discovered".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5c051dba32a51fa8..7f1e11b78371501a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2493,7 +2493,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	/*
 	 * We're done initializing the bus and the controller, we can now
-	 * register I3C devices dicovered during the initial DAA.
+	 * register I3C devices discovered during the initial DAA.
 	 */
 	master->init_done = true;
 	i3c_bus_normaluse_lock(&master->bus);
-- 
2.17.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
