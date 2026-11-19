Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D5606A326
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IUdCSjUS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mj2rhVaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VD9oIrx5vJ2WwLtw849L8TYgTfu43oSlq6ULEz7GylE=; b=IUdCSjUSF6Cj2OSGbcUlKzWqZi
	fWHSr7/5YgXvunBN+H42DtP5RHvUHInhvZyVrRjLNYIWU8dodiHiCTyFxwlnDe4C/cofrwkOW6UTY
	7i/Vcx8VC9SeSrcftK4TA6sMbb33ov/9kaTKwGcMv/0PfMFebX+yg85N/uvwAKcyuU69sh661TRUP
	Afy5OARhF4lhZVF0uQDKTX+QzrApN4ZLkaJLuY0Vkox0qMevziiXan/QAfYT1/FbiYsgI6Hn0xCl+
	tTAd19fYQn0ouzq/wZdm+GiIo7JyckAY3Rbj8+TbJVwZjn79gRfJs23fUwrf/lfmismeJoTiRVQQw
	EJjhTITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Dz-0000000Bpyb-1mx1;
	Thu, 19 Nov 2026 12:26:47 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Dx-0000000Bpxm-0mTg
	for linux-i3c@lists.infradead.org;
	Thu, 19 Nov 2026 12:26:46 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36dbde64409so3726715eec.0
        for <linux-i3c@lists.infradead.org>; Thu, 19 Nov 2026 04:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795091204; x=1795696004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dh9ymIZplalxsaVK1Vez24OxtVY+OAshqM6T/QkbeW8=;
        b=Mj2rhVaYKEP7MAc74KEnLBpPqb123SQh1uGNprVwJEXk1OQDjeMUWLmBIo+EPKbMWv
         G3I2pLBbI3I6alGZrcgtzSAbofob/vt7Oft9g0ERhwjIk4gNqRBmGQgDLha4zzTa4Lqk
         ZHmsR93Sc1JW5pbFN8J7gakdBZu3g/wL5jWF5sKGrWMKw2Xe2QE5dvLp5Smj5I+m/tQ9
         Gj8B7Zapj9qC7J2tJARMnYTi9KF/R0kI3lEh6vStCQMS4YYdk7RJX94YJy4qRl1nf8Bg
         4E0nMWU9nCb/4XnmdhE17i7aEqlljZquRWEGr6WDVvgR8MRx0j/u5dF5dUNZqrfBjviJ
         PcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091204; x=1795696004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dh9ymIZplalxsaVK1Vez24OxtVY+OAshqM6T/QkbeW8=;
        b=g0heuijsXwM1SKzqKjOrwwwASrqmZ9HdXuNB1FN7J52PGwHoN/ds+5egyVsPzjGJSV
         l6We+M5Bcv+8i7dGZAiQoDvCnX4FJ3wjMhZMkaQvPL+U65xwOSGT5pFJOG/Q/rL37Kp+
         Shaab0OxCMDPSPRVvV02IvM1oQaByXisXmSrvNC3C0n34OqJNpjZOyYtMv58rm0OZs1h
         Y5lo6nKoBrP8g/zPGokfkvEMWLvdZLo/1Nio5e7MOGcb/PztWatbhpqq+NTc/8yVmxSq
         VKAASInK8BYxV/T781ei/jHC/ZHsNVs83QwFR4RM28aqzBnd97E621EShcX2wKBTNhEs
         PfSw==
X-Forwarded-Encrypted: i=1; AL+hErEXFVW4t/ddGYqB5j//EEJ0T466eh2MgvJLB7gnMM/b0m7jCWOKWmvfE3Yrug/hAUngJ0PhpoyVl74=@lists.infradead.org
X-Gm-Message-State: APuU4Z+MlhxcthnWhzbnOlG+voHBYcY1cGEiw8D1NKlWeBwJpeoPa3lo
	s6aY67r/vWZOqKwC+EKOdQJV5IKSMXGNf6mHFtay6gKDzS0Z3pExVDt0
X-Gm-Gg: AZFdTZfgonrWndf+Mmt8ZoGrXjxliIUDtGghTxAzBd2yfzQ1XJVA925Mr/w6G/DzR1M
	p6ohksupW8bo44F3lq4LRLvZqrQ/b4P6afbvu3aB6P9vchlXOLY2uyNxovBwUK9ajdyxvcEBLBj
	qK8MSclbLpXFvH0Mttc1qO2im7o0onxeVr5cThDn6oHU/yurlZ0qfa5e9UxCEoAf55uxs7fLNOP
	pvuRmpueSJhN0P2nuL7dws4iZ0hslkgtLiVu656CVUASRkYOX/mWsCAhUnVd0jvoMz6GRR6lqNP
	YJej7XQQm2HQ1YrOf3XDFjhOXchWlfFbxvXUL5DbBt75BcIYdVnJ6/K9ZVb2PDSeq6VPlKOdkC8
	r49x55VEvmw2Uh2vP7OAuGHafqpUuBr9v/v0XeYw/vYPAWyiYGAXALO7TR6Nt/tRlFzYp4qfzeh
	ypVPHqZQz8VGs4Cg27D4q2kBm1qmoqwwi2h79/r5bmLMWX+EZq+z5pEhU5X6D57mzbdcC1svCEz
	KPN3RlKvmlvm4AIazt3yrUzHhNgl26kAEQW0W/gFzxMflz7agbswsy5JOWjKY9DpXDqfU+5KfwP
	8TfJ7sG2VAO5YsEVOoraF7PLrlQJBE8qQHGwqvsqYAM5M7wTrBHdJDw=
X-Received: by 2002:a05:693c:88c5:10b0:383:bef:b6f6 with SMTP id 5a478bee46e88-3830befbb72mr4107693eec.21.1795091204290;
        Thu, 19 Nov 2026 04:26:44 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm16516585eec.21.2026.11.19.04.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:26:43 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] i3c: dw: check the response data length against the receive buffer
Date: Thu, 19 Nov 2026 20:26:37 +0800
Message-Id: <20261119122637.1368308-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119122637.1368308-1-maoyixie.tju@gmail.com>
References: <20261119122637.1368308-1-maoyixie.tju@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_042645_247831_38C9EB1A 
X-CRM114-Status: GOOD (  16.26  )
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

Found with a CodeQL-based static analysis tool that we are developing.
These cases reproduce in a userspace harness under AddressSanitizer and
UBSan, which report none of them with this patch. Not tested on
hardware, only compile-tested with W=1 on next-20261116.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
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
