Return-Path: <SRS0=5SuJ=AU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0377EC433E0
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2020 08:51:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C44712067D
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2020 08:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMv5VScX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C44712067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=22Bp5fTbsQ/mVjPVB5QE36AIOpLObvi7cAYRaUXrj4Y=; b=aMv5VScXiwoo/VZ1pdSZksqWZF
	VYTH9bzXZD216Fg2MArnlRTA61nOB6AfDnCkq0R/DBi3ngz0lw1td0cg9OHZa9WEYXebsl6VZAa3X
	QobX70fD5D6nKMFJxO8KA6WO/OxYwYQrGg0JoJua109mejHD/cWggRhXXpGg7IWCQ5aaBKFbRzikF
	hqmHH7VpQnvdI5V8IAoAMHt7J0oWNU1VJN+ZtMkJ7KrSVwsd8UN2iPF8AFllR2npBf2lRzNpkenV8
	xHgmjpymzuzSaY71d7JcKk4X3Ir6L4EsM0YKlJanWujXR8DaD4kjlm1a5Gu3oEYJXw9iDb8NQIJhx
	tXQTKW/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtSHN-0007HV-7q
	for linux-i3c@archiver.kernel.org; Thu, 09 Jul 2020 08:51:41 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQ1M-0005Z5-8d
 for linux-i3c@lists.infradead.org; Thu, 09 Jul 2020 06:27:01 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8E18EC0003;
 Thu,  9 Jul 2020 06:26:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: master: dw: Drop redundant disec call
Date: Thu,  9 Jul 2020 08:26:53 +0200
Message-Id: <20200709062653.24915-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_022700_413597_46D54816 
X-CRM114-Status: UNSURE (   5.73  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 09 Jul 2020 04:51:39 -0400
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Disabling all event calls is already handled by the core right before
starting the DAA process. Do not do it again when the DAA process
completes, it is redundant.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/i3c/master/dw-i3c-master.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 5c5306cd50ec..c65aae589b29 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -816,11 +816,6 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 
 	dw_i3c_master_free_xfer(xfer);
 
-	i3c_master_disec_locked(m, I3C_BROADCAST_ADDR,
-				I3C_CCC_EVENT_HJ |
-				I3C_CCC_EVENT_MR |
-				I3C_CCC_EVENT_SIR);
-
 	return 0;
 }
 
-- 
2.20.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
