Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24444E63F1E
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Feb 2026 06:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i/HB5RcKDmc3tDV5nMtq/oqtlDdRfq3lohE6DGzr5h4=; b=mis34oD8YChzIW
	4e6/CkaZ3/Njyq2TUxpXop0EwyAqqsje24iR358dvgseofNIpeV2NjmqrgHdvH9M4lIWT3n+vwGCm
	CpP4JRaLCCBh02b4oC77YJ1YqU7ajE2B+4G8wUiO+/I/rOruk5Ww37LJVSJ6WV+x53ccgL7TNmskf
	7X/znBElH6JGAgX3l1W6UbENHXbaayCnGT8do8b4pOQuGmBN+m0aAMy3eycRWy/pIiet9nPTz+wb0
	FJsWJle0ed0ZKp/fCmKPA1TYpPgZe+ETV8P50qs4+aztYiwwMVhety9GAdhF+1l5FzPHk1vorGVND
	QKXRtLJkqw2GmPRhx41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrvh-000000061d4-3Mmz;
	Mon, 16 Feb 2026 06:17:57 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrvg-000000061cq-07n4;
	Mon, 16 Feb 2026 06:17:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH] i3c: master: svc: spelling corrections
Date: Sun, 15 Feb 2026 22:17:55 -0800
Message-ID: <20260216061755.2801697-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

Correct spelling for 3 words as identified by codespell:

svc-i3c-master.c:340: tigger ==> trigger
svc-i3c-master.c:532: reamins ==> remains
svc-i3c-master.c:734: filetered ==> filtered

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org
Cc: imx@lists.linux.dev
---
 drivers/i3c/master/svc-i3c-master.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20251210.orig/drivers/i3c/master/svc-i3c-master.c
+++ linux-next-20251210/drivers/i3c/master/svc-i3c-master.c
@@ -344,7 +344,7 @@ static void svc_i3c_master_reset_fifo_tr
 {
 	u32 reg;
 
-	/* Set RX and TX tigger levels, flush FIFOs */
+	/* Set RX and TX trigger levels, flush FIFOs */
 	reg = SVC_I3C_MDATACTRL_FLUSHTB |
 	      SVC_I3C_MDATACTRL_FLUSHRB |
 	      SVC_I3C_MDATACTRL_UNLOCK_TRIG |
@@ -572,7 +572,7 @@ static void svc_i3c_master_ibi_isr(struc
 	 * 3. IBI isr writes an AutoIBI request.
 	 * 4. The controller will not start AutoIBI process because SDA is not low.
 	 * 5. IBIWON polling times out.
-	 * 6. Controller reamins in AutoIBI state and doesn't accept EmitStop request.
+	 * 6. Controller remains in AutoIBI state and doesn't accept EmitStop request.
 	 */
 	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
 	       SVC_I3C_MCTRL_TYPE_I3C |
@@ -774,7 +774,7 @@ static int svc_i3c_master_bus_init(struc
 
 	/*
 	 * Using I3C Open-Drain mode, target is 4.17MHz/240ns with a
-	 * duty-cycle tuned so that high levels are filetered out by
+	 * duty-cycle tuned so that high levels are filtered out by
 	 * the 50ns filter (target being 40ns).
 	 */
 	odhpp = 1;

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
