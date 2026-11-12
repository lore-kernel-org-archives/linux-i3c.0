Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00B606B263
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WZpSA0Cu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FZXkDvXs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=n0vVDvgV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ebho/bYXh6TrfdieZCMTcSD/g9cPUHjKsvyKVIuExrQ=; b=WZpSA0CugR+pAHK9/nxhIGcupx
	BjfU3wVnt9DKXNg7a03g28DiAnoWhlKDkuMS4tftqNKYvHh62JUyQJrDTBjU+Ku0vFB2COqpTOmWm
	auKlZt5kRU7wk4CbVGSHyGeNLuuiQ9RtQ++Ir3w0wYZZWgrsc7NxPwBWYlpKRXxLg6CfhX9H2nQFf
	OZ7CyLC6zPkORGbwdq+2aFt984rXHik4j6aXGbWJV8u8XZ4tN3jpFkHof5V3HDoVH47bLeYIb86SC
	1LZFptFlEhCZ0w8sOR7ZeV84+LivNI9XBtCF/sh6WzxMQht5Z2f8GeuzBr6j8oESJQKW16AOakxw9
	B96Ykd/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQPE-00000009D8t-1FRU;
	Thu, 12 Nov 2026 08:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQNE-00000009CKA-3Ozp
	for linux-i3c@bombadil.infradead.org;
	Thu, 12 Nov 2026 08:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=eRXYdPEJrt01azKgswlYdvVqc+Ae2UXCVEOtqPjXV2Y=; b=FZXkDvXsUt0B5CFEOwHBEZNZe0
	rwTlZ/8PGLi2naVtmSiNqR3W+yIpyXDbrCyvYNF1Xpw//leSUYc/+4EgUaUzJLxJEQ4YgnVxWTX1j
	DsXrougf8BsJ+WzBA/LhEruKP47/HIl5l4RgiCf5Z+fFukjBZ5vBIuLmHznXt2w1KVQt+qLNxopQx
	dEqmrAyQU9+xe3mg0SfzscLkLcFbTWI076qe2iY8EJ3nxqGmgfVgtGc2kstdrImtpaOkUKkBWXkqB
	oOGoORgFrt1bbNVAHJ1Uz/QKgpueJyInYv/OiCeqD1udkcJW+35AHB5pKsxE92/0Xd7XJ8vcR18/x
	gMuVxd8A==;
Received: from m16.mail.163.com ([220.197.31.5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQNA-0000000A4iY-2J64
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 08:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=eR
	XYdPEJrt01azKgswlYdvVqc+Ae2UXCVEOtqPjXV2Y=; b=n0vVDvgV/gjvsCMH+P
	viVnOWbBUzkdJI9et9Hvj5OhMftD/Ss5U8KDjiNT5ZXPI4vmoPh4GlLceNyyHLFJ
	NCeKOMh+Xlr/mBs1IKDgMj/IDIISG1zk/CDn9Jj5O5XSx6SlvgpxhhnvuPrLK7X9
	XApdBhCqOsjYuAQHuLop3aDvA=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD31xyYe_VqV+UIGw--.58885S2;
	Thu, 12 Nov 2026 16:40:58 +0800 (CST)
From: "rui05.wang" <wr574332525@163.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: dw: Prevent premature transfer completion on IBI
Date: Thu, 12 Nov 2026 16:40:56 +0800
Message-ID: <20261112084056.1147-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wD31xyYe_VqV+UIGw--.58885S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1rWFWDWFWfGry8ur45ZFb_yoW8WryDp3
	y8K3yFkr48GF429F4UGa1Yva4fX3W5Kryakw4kKwnxurWDJ3WYvF12kFy0qF1xXFWxZ3W0
	vr45t3yUuws8ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbUUUUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC9hodtWr1e5p5ZQAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_084133_099575_E1904EBA 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An IBI threshold interrupt can arrive while a transfer is pending and
before its command responses are ready. The IRQ handler calls
dw_i3c_master_end_xfer_locked() even for an IBI-only interrupt. If the
response queue is empty, the function completes the transfer with a
return value of zero. Later responses can remain unconsumed and keep the
response-ready interrupt asserted.

Only call the transfer completion handler when INTR_MASTER_MASK
indicates that responses are ready or a transfer error has occurred.
An IBI-only interrupt leaves the transfer pending.

The fix was tested successfully on FPGA hardware.

Fixes: e389b1d72a624 ("i3c: dw: Add support for in-band interrupts")
Signed-off-by: rui05.wang <wr574332525@163.com>
---
 drivers/i3c/master/dw-i3c-master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 34aa8f8..19735ec 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1527,7 +1527,8 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 	}
 
 	spin_lock(&master->xferqueue.lock);
-	dw_i3c_master_end_xfer_locked(master, status);
+	if (status & INTR_MASTER_MASK)
+		dw_i3c_master_end_xfer_locked(master, status);
 	if (status & INTR_TRANSFER_ERR_STAT)
 		writel(INTR_TRANSFER_ERR_STAT, master->regs + INTR_STATUS);
 	spin_unlock(&master->xferqueue.lock);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0.windows.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
