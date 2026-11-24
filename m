Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F4606A31E
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1JPektt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xO8wcDCp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3uQB+uRAey4nS0g/FhgZRGLlJ3ptwwZVtEGtFQZJ6Yo=; b=Y1JPekttf0IwbjWgMGZ2pKsDn7
	7f4Pe2TF5SvI7M6etOPR220BDkVs3BQYKXEXnSO+yycjB5nZgFIdHanF6/YeoOflQ4YJgU99IXnED
	iioRsR/0+jZDTtb57NDct/6MREFftNNOSMv+3pbm6cSK6nUDzN4ydYiJ/wnntfuRfz0wgKeVQW3jG
	aKwdArN3pa7lrg4tUIntgnBnNmS4D6MwYvUg70LkM0Abuo2Ipr8prtaSUHRhR0+nZej9YbUV9lPfx
	cMVXnWx+tbe6M1rOOaY8ynx2ViaZxecO+FhMGNRGdrx824VqgtwRjZ3bNaMYzfA3lvXoUcCQPKPjy
	QEMSt5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlkC-00000005rkc-0ZA8;
	Tue, 24 Nov 2026 08:19:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlk6-00000005rip-09oa
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 08:19:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b439e37813so1882733a91.3
        for <linux-i3c@lists.infradead.org>; Tue, 24 Nov 2026 00:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795508349; x=1796113149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+F+F57Ny9xfispLPzjEOAMsoQ5APyywQ/gJGUHTWuA=;
        b=xO8wcDCp4cP7LDRckLC4YA4xtpsgqFZUjOD3bINaL4RVRsl48RTHxw4SfYfDD2FaUZ
         9HV5jk3QE1fXpGSAFhTCQzetJwyTBU0U4MUaeaowkTGJSHBZuBmFS3iOwWDWMdyAmqXG
         zL1ZyP0fGb3WonI8FWLOU8NFnqFRyqOLvpfAbQlINPxwSIIyEIqNdKaA7vue6MnK5K7R
         cFSW8YGUOnMhQYcwXt5t07Q/ESmC9CQKKqBPnDsLM6tlJjBLbd/PlpMl87Xew8X9/EGM
         /6cq6qZl0kCBN0UBEf8rSxGuuwsXhT6FS6Ff3b/pGh+lujg2fNFO7FnmbvDy2ZPm2Sj/
         z5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508349; x=1796113149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+F+F57Ny9xfispLPzjEOAMsoQ5APyywQ/gJGUHTWuA=;
        b=d92KL7nldIMIfIAiw91hqgy/YdK8bQpwVesOjzp2h8ayPq5IDJxSUlg0rxuBWG0S1V
         KEvsPEOrlt6VngOG/Y2v2dLSAIJUxcz4iV6kkioFGIEnnBnXBVNHgfFH5cVw4o+b5wda
         Aac9K9A+TAhhll03gjey/LVD2cq7EHiWKzX80LyN8nKdI84yUUStDL+OtD4jMb7mgzs/
         Zm5QMAJXo+U+yqr1uLSxix4Qr/Lj+L+AeTi9YVPGXwcnB4IVk0tv9xSDWhwU5rSYiL2U
         pkeIDK3xYnyNzGKUdw5R/do+mT4zjG3AipF9ZzZUr6zwCH/hgH4k3A3b4jIuAUVJ0DTm
         fz+g==
X-Forwarded-Encrypted: i=1; AL+hErEkeNKJYhsGFrC+5fa8jYFaEl1IeUq9qinlmwXHjgy+QcZT6lB/LkDf/Iu17tLUx0643gpKEmA2SOk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9xq0UjNSkXhsSSPDsYd0v44AODtV7sMquraIvNKhO/Rva0W9ZK
	oq9TTpJb2mBL8hM+atmU9divk2WI9dV7lne/9WE2eXMWWppDlJXZkuzZ
X-Gm-Gg: AZFdTZcCG5x4IrwTZxOf7nL8l2Hd+6pT3K2adN9s8/po0R1yrt6NyyuDq0tyPs5DiOy
	ItYNBv/vovV3+lufybcWEpp2CNd4EmTb0TK1j5YTXUN9REvH5DqLv/1m2TAEZm3Hl7AVx3rSeNf
	0snY79ldyd/jFUxCJWnglo1LlxulJuKKyQqzBcmCrV9hw7cgFVxxqLo01h2Z9Vv5TLJukVolvF6
	QoL0kulVqBXVQQ1W6xZakNflnwFIF3euc6oWoFJ9UDTTnLjEN+t/8sd3a947AmvgHzUohcHJntu
	SKYLfIpF8DiqoNnL5b4gRJdD1LfC/RloGwYm7sqxjDzWNJ6IBPTIahRyMAQsltRSoJ9D1hzzonm
	wc8xtbHo3XHnfhx01wLeTbFLDKFG3pcDc5JKTkcLsnfi5GeIhj6CTcwptW1/nnr8QASZ8yTlJck
	Dffecj56TOcpavrQdWVPyzD3LixsfrhDRkwLOEq5fmlwBfnR2bE2ekpZ69UYlO81462AxwG5lCy
	YIkyk/t8FNeKiLRrFZpwo9Nr/L90QcbHLnAveQvxMJTqKRUcxPJNhT3zKdZNyOT5Kc5J+gTHLvz
	dUDQ8UE5HfcpRRAVV3VdrZ0tEKMOUEMV58VG6iJeu2OY6T03Xmh2Vwo=
X-Received: by 2002:a17:90b:2585:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b41c9cd182mr11893040a91.23.1795508348677;
        Tue, 24 Nov 2026 00:19:08 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm6557412a12.25.2026.11.24.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:19:08 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] i3c: dw: check the response data length against the receive buffer
Date: Tue, 24 Nov 2026 16:18:39 +0800
Message-Id: <20261124081839.3890375-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124081839.3890375-1-maoyixie.tju@gmail.com>
References: <20261124081839.3890375-1-maoyixie.tju@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_001910_081776_839ECD2F 
X-CRM114-Status: GOOD (  15.91  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dw_i3c_master_end_xfer_locked() reads as many bytes from the RX FIFO as
the data length of the response says. It does not compare this length
with the read length of the command. With a longer length, it writes
past cmd->rx_buf. Data for a command without rx_buf, such as a write or
DAA, is written through a NULL pointer.

Skip such a response and fail the transfer with -EIO, as for a bad TID.
A response with an error status still sets cmd->rx_len, unless the
length is above the size of rx_buf. DAA reads the number of unassigned
addresses from cmd->rx_len.

Found with a CodeQL-based static analysis tool and compile-tested only
with W=1.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2: shorten the testing note as suggested by Frank Li. No code change.
v1: https://lore.kernel.org/r/20261119122637.1368308-2-maoyixie.tju@gmail.com/

I used an LLM to help write the harness and this patch.

 drivers/i3c/master/dw-i3c-master.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1e0fdebf58d654c..895cbded5b8129c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -478,7 +478,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 
 	for (i = 0; i < nresp; i++) {
 		struct dw_i3c_cmd *cmd;
-		u32 resp, tid;
+		u32 resp, tid, len;
 
 		resp = readl(master->regs + RESPONSE_QUEUE_PORT);
 
@@ -492,8 +492,18 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 		}
 
 		cmd = &xfer->cmds[tid];
-		cmd->rx_len = RESPONSE_PORT_DATA_LEN(resp);
+		len = RESPONSE_PORT_DATA_LEN(resp);
 		cmd->error = RESPONSE_PORT_ERR_STATUS(resp);
+		if (len && !cmd->error && (!cmd->rx_buf || len > cmd->rx_len)) {
+			dev_err_ratelimited(&master->base.dev,
+					    "response len=%u, rx_len=%u\n",
+					    len, cmd->rx_len);
+			ret = -EIO;
+			continue;
+		}
+
+		if (!cmd->rx_buf || len <= cmd->rx_len)
+			cmd->rx_len = len;
 		if (cmd->rx_len && !cmd->error)
 			dw_i3c_master_read_rx_fifo(master, cmd->rx_buf,
 						   cmd->rx_len);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
