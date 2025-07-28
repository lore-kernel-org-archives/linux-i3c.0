Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F084C83F26
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jul 2025 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/NEH4vWZD6kM2OhTogrsCbsNorZg3sKwMTfljEPX1wI=; b=lDFIeqgUako5CE
	xMdpqRIEysBsf/KmDE2tP0PcyqR1NWGymguc3ENBPAUTjYP7UATZKqYeruA7FERY+BeoGhlHsZVHr
	8qc0uV7GBM6HD/5GqLlVRMzIwcgCcXF9gMsyDD9HnChmEPuBAOd5wHW6JecEi1JS1uI/MYKpx9atq
	Y6K6lGsgSqFcBy7w2l/0hozqxd5D9ty+WgxcuhaFvpwN84kciKNCDp7+Hf+lixiC3UzpK0JNZfVZl
	KWnB2cWy36y5Oupe2BD2lLu5fvM0dxKa+newAAbEhZ2d29DpWOzcY863wrVuTBFygasBGIInmcfIl
	3EazpOpA/MeTv2qro1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIrG-0000000Dw7r-0r4B;
	Mon, 28 Jul 2025 08:05:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIrE-0000000Dw7H-3E3k
	for linux-i3c@lists.infradead.org;
	Mon, 28 Jul 2025 08:05:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-74924255af4so3541750b3a.1
        for <linux-i3c@lists.infradead.org>; Mon, 28 Jul 2025 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753689916; x=1754294716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3Oc+mR2KuG3z3xaNZHJFJeibphFim3rI0DGIkQkO6A=;
        b=CrdivHYQyJGUaXEh29OomZVTJxKQsF+XFUS8UM6K563ZfiyLkjFaAVDp3lHZV2zvUT
         jsSHVgyhpWAfdLpTnTlYWYQfRF/cP0MXZliMl+KjXHgOj6zI1dubGKEkVc5hB5Tma/Vp
         brSCKS9zmodNoCyzsZuIU2mM2O6rgxpzUVrRZgfY7QndH9juQ/D2qFTsZi5c/rQkdJCP
         UoNyuSw5ERJebUoGyCKtgez0MLMMoekXnr1gv4rwzjRwjay3r+lfLhgeShDcm3qrj3KC
         nEI5vR9xaILBufYAsZHvcpQuOwgYwuKrl8wHFqtUhN67urjIfHFwgHLM3hZxRKBsRpUO
         71CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753689916; x=1754294716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3Oc+mR2KuG3z3xaNZHJFJeibphFim3rI0DGIkQkO6A=;
        b=UTiU2BAZaCyFFbqTIivUXOFCxD9eTas8ZNnHM8E+YoVnC9pfyiDOoa+NdQ45PqRxN8
         l88hGXqOeGjBQkkNicm8bOmJzZKm7K90XJgB93VMM20/Jgmol4M3dcJCxS/9nF4RjAmt
         pOYG2YE56cSFQsFHcw+Lzii1VMPQ9eZvh8XQ+Q+lsn5LT260DlINDioj0d4yvOCCfZVW
         QJyShSewsWUWYxcXVoRJtfn51xNzDSijsfdCuO1KS3y1HBgGSdxagRZR9H7810nwkeBM
         +4iPIfYIJPbUuHU4BdQhnqWZgM120HR0K+p5EuOPnAQF4QclGvK31ZjpCpghrbEFL6PV
         Gp4w==
X-Forwarded-Encrypted: i=1; AJvYcCX9BKZTafkR5++Bgka0k0vuymAI2B44xmJUyQpociZuMnvkOOtFpxXW8lJi4QewA0B/l2NVLS/S8y4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfUxHFpBtcoR3HVYy4ZFKbCngXqgoWgOTHxwxT0Z3L19DQi9Lk
	uL32h9gCkZ2QR9YsMJCZh8xRdAKN58veKGU9nlUac3P1NNQ5MhP2nP+qTdTkUQ==
X-Gm-Gg: ASbGnctS+pcak0pUEZEFDYVhQV4wh+MFOgc2aPJBdS/nYT/8lbCSqeNWuvKJx7xzQlX
	nf4S+sKj9mwm9ph3LsH+q5/icUPzEUsdtg567MYZrfbCChaQ+7mF1f7DaIgzwIDvLAeiqruEFvC
	E+zUfe1nlcw4j3ClhA7EQBFZXaDQ88/fCHwqT9zG6p3U9koBfF9OMtUjO7KYi0QlCyOnNUAsx1v
	UTo0+EQAI8GNXaMYhaxq9lfyBmz+2MIytCigJuWag8lPYmHL67U/3HeUOKFEsZk6Y+FUaueH8pZ
	6RJyIy3b6ApiQPsJb/tRc8zdsQpn4OSvqwSpDYcjS/7HBJLa999me4LS3js4cxp6YhQVA6g4ONk
	1my60hNgXA12NI6O5qrAsRPpP38vcHUVf
X-Google-Smtp-Source: AGHT+IH1hanGyoNS1mZu3A6pq3+qut8z3SbX7sMFBOxpHlREXfl3yRlupsfBR6nUWReumhCBMpt7ZA==
X-Received: by 2002:a05:6a00:2ea8:b0:748:f135:4fe6 with SMTP id d2e1a72fcca58-76335980736mr13588630b3a.10.1753689915606;
        Mon, 28 Jul 2025 01:05:15 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:60db:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640adfbf7asm4908203b3a.75.2025.07.28.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 01:05:15 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v2] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
Date: Mon, 28 Jul 2025 16:05:08 +0800
Message-Id: <20250728080508.1743052-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_010516_813033_4895269F 
X-CRM114-Status: GOOD (  15.83  )
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

From: Stanley Chu <yschu@nuvoton.com>

In a private write transfer, the driver pre-fills the FIFO to work around
the FIFO_EMPTY quirk. However, if an IBIWON event occurs, the hardware
emits a NACK and the driver initiates a retry. During the retry, driver
attempts to pre-fill the FIFO again if there is remaining data, but since
the FIFO is already full, this leads to data loss.
This patch adds a condition to ensure that data is only written when there
is available space in the FIFO.

Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
Changes since v1:
 remove svc_i3c_master_tx_empty helper, instead check for available FIFO space

 drivers/i3c/master/svc-i3c-master.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7e1a7cb94b43..ece563353895 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -104,6 +104,7 @@
 #define   SVC_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL GENMASK(5, 4)
 #define   SVC_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY 0
 #define   SVC_I3C_MDATACTRL_RXCOUNT(x) FIELD_GET(GENMASK(28, 24), (x))
+#define   SVC_I3C_MDATACTRL_TXCOUNT(x) FIELD_GET(GENMASK(20, 16), (x))
 #define   SVC_I3C_MDATACTRL_TXFULL BIT(30)
 #define   SVC_I3C_MDATACTRL_RXEMPTY BIT(31)
 
@@ -1304,14 +1305,19 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		 * FIFO start filling as soon as possible after EmitStartAddr.
 		 */
 		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
-			u32 end = xfer_len > SVC_I3C_FIFO_SIZE ? 0 : SVC_I3C_MWDATAB_END;
-			u32 len = min_t(u32, xfer_len, SVC_I3C_FIFO_SIZE);
-
-			writesb(master->regs + SVC_I3C_MWDATAB1, out, len - 1);
-			/* Mark END bit if this is the last byte */
-			writel(out[len - 1] | end, master->regs + SVC_I3C_MWDATAB);
-			xfer_len -= len;
-			out += len;
+			u32 space, end, len;
+
+			reg = readl(master->regs + SVC_I3C_MDATACTRL);
+			space = SVC_I3C_FIFO_SIZE - SVC_I3C_MDATACTRL_TXCOUNT(reg);
+			if (space) {
+				end = xfer_len > space ? 0 : SVC_I3C_MWDATAB_END;
+				len = min_t(u32, xfer_len, space);
+				writesb(master->regs + SVC_I3C_MWDATAB1, out, len - 1);
+				/* Mark END bit if this is the last byte */
+				writel(out[len - 1] | end, master->regs + SVC_I3C_MWDATAB);
+				xfer_len -= len;
+				out += len;
+			}
 		}
 
 		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
