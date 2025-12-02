Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5131ECFD2F6
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8QvwpoQXZLJub0NfjXkMZXGIUiP0Jl3WB9J0ha3EBa0=; b=WFhJhZQO/8ZtEQ
	r1IYCjIte0GuV6m31OMdFuotq0Yq5xiw42JXRPC8k+T5hGqXFk0xTWGKALSjyXLSozOgk17HeY/XG
	3yk53yDDNErVYpp+164bjtFmVE9dd1oOu5KM+hkW19G9plCXJEoACYyv15GIPXu+vqWXyhlN3A5GJ
	yabLisC1mJ/C5CKJP52KBNqMSKedYLSmI5naZ0FKWXNJtAYCdemIxcATELDL2XDhOAa1UNXREbFiB
	L+DdzEckPckVLfWFwK54/PZsvEGNqNGkVPnSEV9LBjwagmUmDlwoC5hMyWonFb9XSjrwg5QjgGfUK
	F15l0ud8CZQGkWBYgATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSSJ-00000005Z5f-0Euf;
	Tue, 02 Dec 2025 15:38:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSSF-00000005Z4e-2ely
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 15:38:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B78F34E41925;
	Tue,  2 Dec 2025 15:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EFAD606D6;
	Tue,  2 Dec 2025 15:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D57811919C1C;
	Tue,  2 Dec 2025 16:38:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764689890; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=z7m1z8RSfppe1UBUpQ7IF8vIA87TYKDCi6MHsfmBLKU=;
	b=ZKySZHw5clOZO9WlAXFhIyLKMEhknYtIxDzXEsinjln+QrTwj/yklUW5kyNODAuX7Uuduq
	0rkcRXQ3TrWOtx4WOZZUPBdaVXPfUaMWAJBqCGdoh/+7I+RBuU15EAbW84C+yPkpuJBAgU
	Q79q6ra0sGnd3BZqNreYFWHKpeZfe718Es0+AlA72Lf6P9yZDNZtul7bnErHSAZonTXzPu
	S/51f7UAxASFMRBeEWO53jhTseBbmiXurmcF6FtCTGePOYvHqRGKiW6BIDrgFLWLO6oR4y
	+iDk1u7ydawtCJr0VXZidVbuVakHFsixjHZ2/eYTf9sEnbUs0O7dy0TpGNHwiQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: kernel test robot <lkp@intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] i3c: fix I3C_SDR bit number
Date: Tue,  2 Dec 2025 16:38:02 +0100
Message-ID: <20251202153804.2640623-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_073815_988187_0FFBED83 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

0x31 is decimal 49 and doesn't fit in a 32 bit integer, switch to the
intended decimal 31.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512020956.Dnz8A2H0-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202512021613.97jVprvJ-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202512021644.lp8ZMSx5-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/i3c/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index ae0662d9d77e..9fcb6410a584 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -51,7 +51,7 @@ enum i3c_xfer_mode {
 	I3C_HDR_TSP = 1,
 	I3C_HDR_TSL = 2,
 	/* Use for default SDR transfer mode */
-	I3C_SDR = 0x31,
+	I3C_SDR = 31,
 };
 
 /**
-- 
2.52.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
