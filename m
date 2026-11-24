Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810FC606A31E
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FbXbdS/j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8QUxIQg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=abx5McFJwT39bEXWGQZBioai59VhSqGmnMgjVp7UHMo=; b=FbXbdS/j8q5fRPHQDpxQVbocR6
	2YBm05r5R+9gmsz2NaZJqiGF1otuGarJBenoNnK03Rk0vmWMW4SsuDqW61b6YTI+5QbixNKDNRXTR
	d+XFpyTjun6i781ADHLDWExZA1fwCdT6Ktx/jvrTD0IJOWRJ7PNTMgMG8XGHGPnOyrd5GgGj/O2yR
	eKA/PKbAiJ1+rB8sX/0PUZvp69q4F9skZdN/k4mZnUhm3XQLLFYp3k79BAPHIjDnJtuZ5lYnC6oCD
	LvRJDX70NYI3jUXbLw7ly7vI0pmZcoXz7pegGpv1VQwSLVxfW8Sd8p9qWPgRpm5sLh5oNX8wkywzQ
	+vLvH4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlk7-00000005rjJ-0Lg7;
	Tue, 24 Nov 2026 08:19:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlk4-00000005riS-0ZUV
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 08:19:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso2847126b3a.0
        for <linux-i3c@lists.infradead.org>; Tue, 24 Nov 2026 00:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795508346; x=1796113146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHBGz3X9/y2fDkAOHsbOXSpgZpUshqxbqZ7Tf0vNdMA=;
        b=C8QUxIQg6w84XYf0Kw9D7s3cTvy51drKwFaAU1S4ykfR8DTLbtjvbGfUaRbhNeEIIM
         p92Gw9aFNiU0z3buCO3S1ZX9Y2hWd1YGARZVK3kysiCALAP2JIt33Nv/rhTAb3uHaFgi
         OxJXO74bs+E03vzMzqfjGv53IiBRQL47gIqFN5ECRZJoj+9o7sIvbT8FdQM2fz6R6eBj
         FJOiUrW561SHsGpjyisWxKujNzVUSBYYtio/nbzOkbo+OL+dsHxgXoNLldcLHoOPGEvr
         0q5R4ZsiYczYw351zrpmlglARzk1x3GlqSFSR6gCb2mF3nQ1fBxVTVnFbHqbuJJaR8ER
         sgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508346; x=1796113146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHBGz3X9/y2fDkAOHsbOXSpgZpUshqxbqZ7Tf0vNdMA=;
        b=kpcbIYvR3/Kpq0EkYF2+asJD+/LxfmkqtttrYsTjGzkC+hwlM9XkYdMDB20JpSd/xM
         GeEMin6vH7IiAoTqTJzTij+aqLgwv6GJx4SOKdTPx0Jjn2/Jtq5QMi3NPIuXYzvJBz3d
         mteJl751JIO+UbGkEerO8ft0awqX4aVui/lO+9gzralk1HyjcioILAbX8ug5j6fIdbnZ
         k5yUTkdglUzuN+Q0lH6Zyyq099qv2NU4uYnr8FVEW+kEuWrJtUgYkLnqd/frlmnjS+bD
         pfbvZtRyO9EJibCG/q0f7jxQxZCJsYZxIei8Q08E0iij3RNfG+mSy3j1MDMzLCFNZCv7
         LmkA==
X-Forwarded-Encrypted: i=1; AL+hErGjrVOEJYkG1qmbRP4eMKja2NFbKywcln96TTO5Z7Mds5u5VvumHk4Yj8cF0FRyU0yAEDYfkjTh7yg=@lists.infradead.org
X-Gm-Message-State: APuU4Z/OCt/hoRoBsIWcusm8l1gZwWPKBC7BcH62BsRJcaGIk1rEz/Qi
	TJIS0eDOlgs4nvAocdlC50oDGAX0Zp/9PqUOnUti9lLSfQg1uMAbkSau
X-Gm-Gg: AZFdTZeawUardJhjXrfvFEQkEAlwyCX+0P4RNsoIM/zdJub8cS7bd1/PnIQQG652uCE
	bxFqLYXwuC6Rfvi416XlSIRsR94pp8g74Ky6aErE1Dnsa6gR8ekv+162OA37bD3lsVe8GPEQDjD
	CsWY6XKd5JbsHkv0ZCGCfe93xjVArWCsmEonD4zHbaUom401m3Bjxt/PTfhl4eok4uwaFS4qs0o
	rE4S+DLkZrW61aXsapoxgawMlFe3PVZWegsJeyPONpTerO6Yo0nBuPVVFvgRu7DplJTHTGHkKLq
	HmrtZcz8v8AqLvgwY4SaFgiqme+WV5aXHQC2FJP7Gm0E54InCDsRgRd+fLGrHOptmSAYCXWp+y7
	6prZqIYJyMWbrYPlmn8QQ2+EyDPGIBzg4I4bvRkG1x7wJv4yTkonOfZsqxcY9vXcRRiBFWou2gx
	8AsGYPwuNyEhZnu6xnqBh54scglWQOOQ9fFJJMmcwa2jouQxbUvkJwTxV+bIAyeY8di+rt4YHdW
	irUSI9R4OGKEqtN0TZhlrvfgY7IlbUItQrvvGYSNmVt0oiC+PWRh8cRxnbO1mIDWBZAU5AnCy2H
	yJtGmAfcjwL/n9rM16QRMTLTERcmMgyYXQiHrSLbV586Qz0HXPPYIQ==
X-Received: by 2002:a05:6a21:2006:b0:3f8:d81c:819a with SMTP id adf61e73a8af0-4014d562665mr6832435637.23.1795508346479;
        Tue, 24 Nov 2026 00:19:06 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm6557412a12.25.2026.11.24.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:19:05 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] i3c: dw: check the response TID against the command count
Date: Tue, 24 Nov 2026 16:18:38 +0800
Message-Id: <20261124081839.3890375-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_001908_180623_BAD164D3 
X-CRM114-Status: GOOD (  14.57  )
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

dw_i3c_master_end_xfer_locked() uses the 4-bit TID of each response as
an index into xfer->cmds[] without a check. For a TID at or above
xfer->ncmds, the stores to cmd->rx_len and cmd->error write past the
array. If that response has data and no error, the driver copies the
FIFO data to a cmd->rx_buf pointer that it reads from past the array.
The error scan runs to nresp, the number of responses that the
controller reports. It reads past the array when nresp is above ncmds.

Skip a response with such a TID, fail the transfer with -EIO and let the
existing error path reset the queues. Scan the ncmds commands for
errors.

Found with a CodeQL-based static analysis tool and compile-tested only
with W=1.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2: shorten the testing note as suggested by Frank Li. No code change.
v1: https://lore.kernel.org/r/20261119122637.1368308-1-maoyixie.tju@gmail.com/

I used an LLM to help write the harness and this patch.

 drivers/i3c/master/dw-i3c-master.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 34aa8f8e1a0a26d..1e0fdebf58d654c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -478,11 +478,20 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 
 	for (i = 0; i < nresp; i++) {
 		struct dw_i3c_cmd *cmd;
-		u32 resp;
+		u32 resp, tid;
 
 		resp = readl(master->regs + RESPONSE_QUEUE_PORT);
 
-		cmd = &xfer->cmds[RESPONSE_PORT_TID(resp)];
+		tid = RESPONSE_PORT_TID(resp);
+		if (tid >= xfer->ncmds) {
+			dev_err_ratelimited(&master->base.dev,
+					    "response tid=%u, ncmds=%u\n",
+					    tid, xfer->ncmds);
+			ret = -EIO;
+			continue;
+		}
+
+		cmd = &xfer->cmds[tid];
 		cmd->rx_len = RESPONSE_PORT_DATA_LEN(resp);
 		cmd->error = RESPONSE_PORT_ERR_STATUS(resp);
 		if (cmd->rx_len && !cmd->error)
@@ -490,7 +499,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 						   cmd->rx_len);
 	}
 
-	for (i = 0; i < nresp; i++) {
+	for (i = 0; i < xfer->ncmds; i++) {
 		switch (xfer->cmds[i].error) {
 		case RESPONSE_NO_ERROR:
 			break;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
