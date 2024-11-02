Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C4BE677FC
	for <linux-i3c@archiver.kernel.org>; Sat,  2 Nov 2024 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mgitU1Zw/0OIAHxUPh+7oUWKBnVd7qBD5MXOwzYm3gs=; b=ZOPI3UcJa2H6v8
	3REZoBTiv+nAoMBW4HcpoAF/BaBkKJjXw0kinJ9uzfIYvNgqUEkzIKu+6LRMWGlXudngEnjfLEOmd
	Wsn0ijDauAyzZ9Ubconxok2UXMxMi3Kt3SrXyeFSwjxo2eA1uiy7yU0Msj55+4b9t0d6lNeXv0GNK
	WEt6WAS4zHP9ZhIBrdZW8OZWQma96Byp6W2FSrm+S8ZGX3ZB7IuPfhWAbqJj2KinJQ52RVMScOFWJ
	Dtp32p2f3pl25DJjLgoopqwvZzuOFMOYJg+EZY5p//4hGsRL3Cv1o3amRh+8F85GkijSbD8ed1ane
	2R+kt1oYLyut2d/0dUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7EBb-00000009mgG-1Wq2;
	Sat, 02 Nov 2024 13:29:03 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7EBY-00000009mfG-0pVD
	for linux-i3c@lists.infradead.org;
	Sat, 02 Nov 2024 13:29:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F8FC60002;
	Sat,  2 Nov 2024 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730554134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jFPxv4TFcb0xcjLdoJXvXlS5cVkkmSvweU1eSCPIPRc=;
	b=OXoVX7zVuH1FrYOS7yaAMPQqWy0GHZALHFuzYs98iw/JAYE21Nm9iJUZik7qrQ9RW98eFY
	yLnolfg8CELUrsxd6siXsawWXElztVfZDR2GNB96hoSv8IExdtzd767eugHl7Gl3kp6H/s
	gIv/Jln47dYvKZGxhQP2dx+k85FsIw+3prRATLcXmv/+HaHh+tMA9Pipt13HA2aHv1bBzF
	p2mHYjjTiLmATiDWX++i4vF4CJBWQ6VsBqx2vYpmwESSj4OjIqK+0IWofXZ+mZPLZkW4sN
	fp+MQd6vLveJQsOiDBjKPJ7KxOxIeIm9wM1m630KGdk+ucOKJt5R3n061JqmQA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: Document I3C_ADDR_SLOT_EXT_STATUS_MASK
Date: Sat,  2 Nov 2024 14:28:41 +0100
Message-ID: <20241102132841.2446176-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_062900_396501_272DD1D4 
X-CRM114-Status: UNSURE (   8.29  )
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

As the mask is part of the enum, document it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/i3c/master.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 6e5328c6c6af..12d532b012c5 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -298,6 +298,7 @@ enum i3c_open_drain_speed {
  * @I3C_ADDR_SLOT_I2C_DEV: address is assigned to an I2C device
  * @I3C_ADDR_SLOT_I3C_DEV: address is assigned to an I3C device
  * @I3C_ADDR_SLOT_STATUS_MASK: address slot mask
+ * @I3C_ADDR_SLOT_EXT_STATUS_MASK: address slot mask with extended information
  * @I3C_ADDR_SLOT_EXT_DESIRED: the bitmask represents addresses that are preferred by some devices,
  *			       such as the "assigned-address" property in a device tree source.
  * On an I3C bus, addresses are assigned dynamically, and we need to know which
-- 
2.47.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
