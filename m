Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95E606A330
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VIAo7jkj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fNiog8Bo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k1uCKlT93JGm97KTBOSFQ1d+XMLDh+UVzlQAii23xos=; b=VIAo7jkjJ+rNTMqiPhGWKtyqvQ
	TpUjyBKVHeVQXcNL3REcZ8eqgiAHxZX1rhsFEdTMjkKtU2TlUiPAZc8qB12OFTH6x22LEErVE67JD
	pKWz/ZUK9ymIVun0fdZgnb/+HMGJ9CHqKCnMwP5vaYeXQGWyK2mIxHJbzWlZaBuOq9zzbw/0IowjM
	FtoSeg0y4kUoIl0ynCAevmXY9BwRAQmfMedH6wW+DbM5XUReL3zZNNxoKIiMqKqeOgWym552b9alW
	xiOMCmPscrEKTus8XA0pckh6oBkqS4aE/9Wb97Uq5bA4e+P2kPCYzMc5mo+U/ljJqkM4ON9HqGREk
	/8cFM1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQl9-00000009I6T-2fS6;
	Thu, 12 Nov 2026 09:06:19 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQko-00000009I19-30Er
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 09:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7y
	lTJIoUhHVMU8cJQZ1aoxNGoOowuGM0KzaGzXyZsw4=; b=fNiog8BoT/rt8I4dZC
	ZE3mrMdQAxE2D8mZGTrCdTD8kA7exacgUqm3U1ToPs3fERLI3zVoFpRZHyl+FLfX
	iEee3I2kTDB7HE4wvHG81TdDS3eabCcWFOrsqctFaYW11C9djxu2zVZ1/epwpoOB
	tE3JGYdMu8xyXvNuXFwVnxdDw=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAnVXligfVqmIGYEw--.39291S2;
	Thu, 12 Nov 2026 17:05:40 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i3c: dw: Prevent premature transfer completion on IBI
Date: Thu, 12 Nov 2026 17:05:38 +0800
Message-ID: <20261112090538.1917-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgAnVXligfVqmIGYEw--.39291S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1rWFWDWFWfGry8ur45ZFb_yoW8Cr1Up3
	y8K39Ykw48GF429F4DWa10va4fX3W5KrWakws5KwnxurWDJ3WYvF12kFy0qF4xWFWxZ3W0
	vr45t3yUuws8ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbkucUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC0wSRKmr1gWQkBQAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_010559_175658_4BC47C8E 
X-CRM114-Status: GOOD (  11.14  )
X-Spam-Score: -1.8 (-)
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
Signed-off-by: Rui Wang <wr574332525@163.com>
---
Changes in v2
- Use Rui Wang in the author and sign-off fields.

The possible queue stall reported by Sashiko is in the timeout recovery
path and predates this patch. If I can reproduce it, I'll send a
separate fix.

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
