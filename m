Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE6BC87FCA
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wlZ9Avz4f2TAf77vvuZd8ZX4byWOt5pMweC4A7iUJ7w=; b=fq5yfvz+0lnrfF
	RIA2NFCaoSRaVD1CldSr9AwF2WJNwk2zYgX5atJwaK80HvHSCztGU8lUbPu5s7WUt2CA/u6pxahpb
	oYjCNZFQV8Gb5gbSxp37KPukv2E+lxal5XZmg9Fswa1kbwgYoDDUWdKoWN9lqRAI9jFtQCYEMrVNs
	pvshlBe/f696gKcr4PRWnyMNXKUZv/55xN05lcrWEIN0qPsglUS33BFagxtGyL5UFUu00xtKbQyX4
	YXy73eHohit1TZ/yEdN/Hsu7m7GzlaZrusui6j4MD/6z523/C2xsGjBCs5ntG3887ArwIqcsyZuF/
	xvxthmplZg63GnLI4rtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguoy-00000000OQq-2kgg;
	Wed, 30 Jul 2025 00:37:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguow-00000000OQI-2xUh
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 00:37:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74b54cead6cso4153533b3a.1
        for <linux-i3c@lists.infradead.org>; Tue, 29 Jul 2025 17:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753835845; x=1754440645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IH7dLAPML0i0J6f7OwlshtvTGBaOPfMPixeHtVKbTU=;
        b=EYkClB6peFgmdrhWRqvk9E0iqj1Y7+fgie0+Fhv0Mvcf+oUQKuaGkuwqFoo/s1K40d
         wRpUswUMnpA3bvo/FuB6mOTkzG17iMgZMx4bn+5qxi/O1lq4yadmJZijUGPeNdX5VMqi
         4i7WwhVpBj7BXqiSFlZX5D1fl1dPdx6eskGF0PUT+zzJWVCA4wgksMhgkL3nKAbj0Fs3
         rhQJ0N6pzj+Poq6N0H0Di3/LowNuEJTFl9zQT3LaF5RA9dK/8DRWfnpqUVTsJahpz4DY
         j9rPLEWGkXPRCwv84SYpES1cP+ITgawyreF9GAL1i+kh01djw6UeQ7KK3VLVZxNLUAJX
         NQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753835845; x=1754440645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IH7dLAPML0i0J6f7OwlshtvTGBaOPfMPixeHtVKbTU=;
        b=gkoukwpEUScL9eW2EdVklTZMAQhYsEB4JFzBNXhoH7/Ivuru6rCNKfPOhiXqZYDCc8
         ILboWxnRcCjephvWs2EbRF0bDotqZ6jujoANAGRZU0kqSUQkxnKl56TXIqOtufnEX5Qr
         ysLmK4Q7qcQT0OI1uklCuhSHqkw0OV817wxxepc76kZ5XMIenDblotvkEC+bwKUrX+Fs
         WQRImH/g09OxK9OteacxwsMebvMhM9CaF5Yv5aGjeu9kHxmnk23vAr8lo0oSr3x3G3du
         Q6gQoNw0U99/eZ4ClNGYy4l/QpeexYRH0GSKyah5stFn4n+/FUgjKyo+VOgBSeIsORRi
         6Gdw==
X-Forwarded-Encrypted: i=1; AJvYcCVYYGST1DlCzWvXCZTiX3KWvgaKSr/wjaRtWK0rCWlUEE7s4Y0+NvbniPexs3YxCQFn0KcyTQs1TLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8f8PLxLW6q2bhQFKuutv2dnPYc8iUemv5Ur2GU1WGjwdMqZfd
	8lMIu/wfefF5hhpea81K5ZHVCVM5Vsrvuy+rWJM8f5sgduOI9Y6M/qJ6mF6/uA==
X-Gm-Gg: ASbGnctYNEnOsJcXIEgAvaBXPgGbX3AZJhHP80JqfM5BkX9ayDEWwQ75pz3HtnzyKS9
	ZqskIr4IAwe6vMS/dMhRMJ+ABD0r7NWL7ROn+jSpKJkSMT4DP1p1gxedX+em9cQZEmewEFXZPOG
	rBO9GcAEcJTlrtmkYgXA2CuMYhXYok60fGLAcn5lSVoQ8fDMRUPXxjbgeupBkAFwJR8kric8/ZV
	3TBzaitapBvkeSXnn/G1UN9KcU8rSJthav1wVyv5MebrKpUpSEfIou1ugtnz/eDhCJG28BeHn3v
	SkYoze3bdk89FjVPFmq1tlO4kEvovz6hSKQtsksxecEvTlPHSkpBnkMhTx3Z5Q3FmnZ80UgJ3pU
	WIiwOYXRUANmUTeVVfIH0E6dFwbnwOx4AS8xyvaRtuxs=
X-Google-Smtp-Source: AGHT+IF3xpRXIap3nhoGNQtn5l2Jl04XHZsHgByFscuO5zQRsqQGugs2wjoagzsgM0Rt4W1ybC/yBQ==
X-Received: by 2002:a05:6a00:2347:b0:74e:c917:3b1a with SMTP id d2e1a72fcca58-76ab32e6e99mr2310545b3a.24.1753835845531;
        Tue, 29 Jul 2025 17:37:25 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:60db:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b4c8762sm9099336b3a.117.2025.07.29.17.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 17:37:25 -0700 (PDT)
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
Subject: [PATCH v3] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
Date: Wed, 30 Jul 2025 08:37:19 +0800
Message-Id: <20250730003719.1825593-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_173726_749909_2C3DD290 
X-CRM114-Status: GOOD (  13.96  )
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

Check available space in FIFO to prevent overflow.

Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
Changes since v2:
 update commit message

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
