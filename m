Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C460A261A
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Nov 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CUUnLHO9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsYGlHLH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H2GfVfqXiSQl9SjlaSoIEMggJWFZPWtru8IEI+hF3QA=; b=CUUnLHO92at+LKjdFi7S8VRtY1
	XjAo3EitT10htv/iUne5yXCtW/LcZmeSwTt2/bvcfvCiHUUv5DpWyrqqnIQWVNCltN2iHOlrl2m2g
	cC3khzFxXvDrfGj7x9WT10eOFpIUgfUGz7MVyGL8fQSTJeNJP08coBEa9FxnZnll2AwHVphQVT4Y2
	dadbWGr4kx7R40rmkUBVfsQBfAXR2cV+H/meLTFZXyMI16pGkkFbJANohF7nxUXunY7EqbIT56PH9
	7O3tpHFlvckwQ3ZV5HrfXlNu0h+yJyqiqp/+6IHrHgV91ZLkvfMsEgkQ8HlIw1mvsNScmIi8qidCu
	Az4hzh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Dx-0000000Bpy0-1NSD;
	Thu, 19 Nov 2026 12:26:45 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Dv-0000000BpxQ-1d0q
	for linux-i3c@lists.infradead.org;
	Thu, 19 Nov 2026 12:26:44 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-381f65e4e4bso3360315eec.0
        for <linux-i3c@lists.infradead.org>; Thu, 19 Nov 2026 04:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795091202; x=1795696002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5V87jSK/TmzvUrPVfz6BnlwjCMwECPp1scTiD61UcXc=;
        b=CsYGlHLHtEs665ch6epaQU0BsSFCpFTr2PJ95qPDV8zrWwc7492u2VMdlTK/8tocYP
         DlX4saiFQK1X/FkTnXbAXrS6561RZ9kMyIISoE6L93k3Y3UBHhDdFQeGAFxO8X9X6VD2
         N+2WTqIOvO7VrsFzLIaxjJNfuZjmVfbHyxQPkRVEHgFGyCicI9Z4UN7jNNV6mdKRQeMe
         mRw3UE9vxIzZZ79/jIPALN2tjXkVHgSFG2HHgxjKk+zAqDUAo3ss3xyki2yPb0/7dTYP
         uY80BI9eK5UUGEmnDBVNxOSfyeh9PHE/qlBazDtwLyH6FyBxf30hJm+MZ9Wq/RnoHKF7
         +/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091202; x=1795696002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5V87jSK/TmzvUrPVfz6BnlwjCMwECPp1scTiD61UcXc=;
        b=ZMZGut7/ENbUzWnr9BanOIpC6QamecRjGQUdL4Ya4NEp0/KdfT/g1Che4HHxsEKPWn
         SKvheT+J8tvS0YFHtjzwhcy721+uXAOurclwUTUHeAFgu7osTvffmTHGE4d252zva/Q3
         Kx6/fEtxRMz3w5zJ7j9yKvQjtyPZRCCpFA/C0I3G+8V3z42ixT6YNwshBuXDb8BR5IIG
         KArKtb06mPs/uCL/N/7Qzc2Uy4luO1aW4ai9PiSXk/47Ih3cyHg6ZYeCIx40wRx6cRQ1
         MLXxIRMcDlo4XoZQ1MPpvC4M3tooQwB1d/XBfLTEtbLnWDlwoVLyBClVeIOc6aUvc5KF
         wH7A==
X-Forwarded-Encrypted: i=1; AL+hErE/wlUC4IJRvRrj0pU7qa7HgSme4Pz+pBhxFIbFtdggWPRyn1O2so19DUCUrQpzBY+eUDSKyRR51zA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/kcc33ssCIJojDpVnX9dAK2H7FdxjmedvAWItLt+Ed4uljoM6a
	PfnB3v1MwWEmOWzmR/I7lQ/jNlNOuvII8xCqvDjIWCNdwEcULbKT0KQ2+HtO3A==
X-Gm-Gg: AZFdTZeC74zMJX9zN6XVGAuPPd0Gx3jeALY9iHa7LZJr6AS5QKlu94gh5zOrT9DxY1g
	+ZPLqyf0P82YrTNEnKvo+9MwQkanebpgCz2w7m86i6BPoch8BA0aQ0UpnwojmcZuNKfrjhQzPCe
	xR98i4eNsUsLESqbxYw2jIPrrNeEBJKACwaglQzWxIKqPjeSIpBWjn8+MB+z17++Pu/+wm1AwSz
	NdbUK8Pzjjwu9WxIO7Kfq6LHV2h3UM1VbrK/WE5GLVKKZQGp6ibvhbgIrvO/H3Wb1EIyIkws8j2
	CrIDqI8usHJkpHqITr7aN4kX50BNlZgS4uxWd8ygynGuv6IGKsuy5iUis7tFCtAjCuL6b2gisMq
	iSntGlCVPURHKi7iazIDavf/VdBymHPT2XCGct/71lnxlzjVdjCk8vKMm3DO57fDjKUEFXFq/jN
	lEiz7rAo8oTeI5HJ21qcxOUl6mVwdyrsywEZwWvDmL/KU23ml/sqZAQISfkRzYVWICOjT6/PQa2
	2kpigiMY+5ZGHVOOdeZVo0VdcTOiPtuk7ldlmTm1+dACjn6WUzJ6rbpLznknc6FcuCBbhXLtewM
	2A0zDiitpF58vqMYX8MKRx2Qj1kKtXAL7Kn6j3Tv8QTcdEvEf2/GNg==
X-Received: by 2002:a05:7300:fb01:b0:384:b791:6a41 with SMTP id 5a478bee46e88-384b79175d4mr771278eec.29.1795091202087;
        Thu, 19 Nov 2026 04:26:42 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm16516585eec.21.2026.11.19.04.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:26:41 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] i3c: dw: check the response TID against the command count
Date: Thu, 19 Nov 2026 20:26:36 +0800
Message-Id: <20261119122637.1368308-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_042643_430186_5DA5A9BC 
X-CRM114-Status: GOOD (  14.62  )
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

Found with a CodeQL-based static analysis tool that we are developing.
Both cases reproduce in a userspace harness under AddressSanitizer,
which reports neither with this patch. Not tested on hardware, only
compile-tested with W=1 on next-20261116.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
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
