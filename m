Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4251CAC599
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Sep 2025 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fNkK3rXMHONjRvfcn3rPlxu7qTN2eXpqnwPDYcUH4Gc=; b=b4Z7anU/BcLydR
	4V63OFnFITKr+CqyLaSMtKOMuhUBsEC7ykYjqkqbxXMT+WM6vjKd7LFlE6GoiSOSiw9HiMzGnT378
	BhIYDRGuEiG3PxEqBu6X72QUxhZsmFfRXAescWkJqfQGtjPiWj7SUddrh/y/O/4v9XzxMLroROnp8
	hxdXZp7758GzU2NoW7OszxNs7Z5Q2z9QGK32ZfUNDajhQEyUaMZBjt8Sgdh+/jeHO5gYDtALNtWv9
	Ye7R2/vJ4n3+S82l1ed1MdPbu3Go97uMUHaFpyYQRZyZsAWm/kKCI3LH1NKGCeW9DZp5FawT7Zxzi
	ztJXsADsT9gqsF2D6Apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRkK-00000007KUn-2NNZ;
	Tue, 16 Sep 2025 09:13:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRkH-00000007KSg-1XMv
	for linux-i3c@lists.infradead.org;
	Tue, 16 Sep 2025 09:13:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 153451A0614;
	Tue, 16 Sep 2025 09:13:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86716061E;
	Tue, 16 Sep 2025 09:13:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 576C5102F16A1;
	Tue, 16 Sep 2025 11:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758013980; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=0Dah1yQtnf/tnnK+SFWBAA57wMzVPD3ViO+H3LJ6Y8k=;
	b=HBQ4MuCHNOLPpzeT4qCb6GruhWtHmXBCqli/r9EAPdJtMsE410vum1MKQWOFFbuVwCcEDu
	770ZAx9fffv0/nohWBSAg8EEJzBUbJgdIC5q4bkBxseEUeORi3i/04mzFklWJ7Tf88Ag+K
	QGgGFtVci70Irk85Bi1m4yd+aBHS2BatyYTTmR1E6KzKm6+6haXsFhQICyzr5UR2ns2FMD
	S0oBZJJhe5ikEMku+cw/ee/dhSKwwTKJXd9Lk7iEQzQiAfi+mtyVzFBkyGwgrfE1tOXHHV
	wLzOA8l8gWCrktBTtURKLYiBLq27TGVmbdFrr6Gj3VNgyLe7z10bjrQDcOrwuA==
From: alexandre.belloni@bootlin.com
To: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: adi: fix header location
Date: Tue, 16 Sep 2025 11:12:51 +0200
Message-ID: <20250916091252.39265-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_021305_547110_999BC9B4 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The adi-axi-common header has been moved to the upper directory.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/i3c/master/adi-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 162f9eed39aa..18597ba1f1c3 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -10,7 +10,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/fpga/adi-axi-common.h>
+#include <linux/adi-axi-common.h>
 #include <linux/i3c/master.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
