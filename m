Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29334C27C7A
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Aug 2023 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oSmvZlPvEURivK0z2nOf5/6ateQe31sIgQOVoTU++R8=; b=o/uMJ2qo2J3eZC
	kIQzw4yBnrjns41PH30gNJ1/zW1Q/ClSGEHW4DX76AlfE6U9xzYPEd3Ql+c/fTXEj3VuR3SIz1Hy/
	ICMtF7o1x+2Nqsvb9wyjXM7m1buaWb+ZJuJeUiBAe0tzVf6mOowrPyJ/p1eZ5osv3O6kolc8TR5+h
	bwE6kiNULKwFTYhp0Nuc2L76YLlPbEmHmGlFutyYbpHJimKFZye2f6se74bb5fd7wBB/DXzP4qQ2F
	jjGPtXZYmLtR7SN9MdIQxoGczteptgNopt17JAMTkhhu2xwk4+dfi1QSBOzl1hfBUWC5d1t8f7jQy
	AL1rWJ9aOsujMj0mNPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWa5n-0061W8-1r;
	Thu, 17 Aug 2023 10:19:03 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWa5k-0061VR-1S
	for linux-i3c@lists.infradead.org;
	Thu, 17 Aug 2023 10:19:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 250C7C0005;
	Thu, 17 Aug 2023 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692267535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GUVdThdZs+5rF6tr3xd160zuzNGDWYPFuEffpBzZhmY=;
	b=mfFvQeJwj2nBGdwGm/dk/5XmZuN6ie+f+oYMmpk/1sBdSJLEtKj8OvEA8+Fp2kYQSVUkAr
	CiAewZq5XHfgLMW26xejGVpIcfv1HSy5G9nl4QvBaKv4DkijnTQ9n27IbkURSmXXk1Yynu
	OT6Y8C1LPCaM9kWpYR0XgziMCKXC9S1Ns6Wl02WM0wrBp+RIcSdl0HE/j5jUmYKquKz6lp
	CorUFYkJHSf+pn27ijDOGCEKq02RgF4pJtQ6iXyBxq0XKvpJgrbpNQ/KyMEuHtWiUjx4HH
	XQy2v2loiO8iRIXGnRTcGxhc6h7v+KRqL8EAWJzVIbXsiK5rl/1adcZmtMM6iQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Cc: Conor Culhane <conor.culhane@silvaco.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] i3c: master: svc: Describe member 'saved_regs'
Date: Thu, 17 Aug 2023 12:18:53 +0200
Message-Id: <20230817101853.16805-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_031900_782879_B4E0DEE1 
X-CRM114-Status: UNSURE (   7.50  )
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

The 'saved_regs' member of the 'svc_i3c_master'	structure is not
described in the kernel doc, which produces the following warning:

    Function parameter or member 'saved_regs' not described in 'svc_i3c_master'

Add the missing line in the kernel documentation of the parent
structure.

Fixes: 1c5ee2a77b1b ("i3c: master: svc: fix i3c suspend/resume issue")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308171435.0xQ82lvu-lkp@intel.com/
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 0d63b732ef0c..77a70e9cd69b 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -156,6 +156,7 @@ struct svc_i3c_regs_save {
  * @base: I3C master controller
  * @dev: Corresponding device
  * @regs: Memory mapping
+ * @saved_regs: Volatile values for PM operations
  * @free_slots: Bit array of available slots
  * @addrs: Array containing the dynamic addresses of each attached device
  * @descs: Array of descriptors, one per attached device
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
