Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935D2C433F5
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Jan 2022 20:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZRnZNXQyr87KwPR0K353heP7kBHW9gXL+NM/sDdFf9c=; b=XeHBItl5kgIheo
	NWll198t8XOEfdsgmAnuELpTtJQ94M7ILHppeYaByBDvPA+Qk85lhhhhKNENnjOWcXQNfWHgukoT2
	VwDoiBb3FED/ajH1sjEkPJXDOqjZZ+pKRWRJkyxThYyX+p40di9VCNbz7W9TvRn531RHgslARtLO8
	WkGv3rrhGyCSz30RnITY5UcYW7F+UGZV/i1NrzGgfpAsurbtVC8Pcrb3oP0ji+yhJETbWIzjd2AN4
	iF8P3XKngsewukAa+P14YMI/8TCPzWjbexQfdfMLO/HvRutZwqZbmWa/0Hy3jSthkFE8/99kDZh5P
	f2zmUkaGAVVkgHsQ9EkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n71Be-00DDOR-Sv; Mon, 10 Jan 2022 20:22:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6DM4-006ZyK-HI
 for linux-i3c@lists.infradead.org; Sat, 08 Jan 2022 15:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641654603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U169cYgO0bm4HCQJMyoMslqnpI+Gi+7C/va2IkqTrGk=;
 b=YgPNWlLaqYqLP0rUDyxAJSRP+SOWCfvNEaHrD807DYwnyFQPvf1FfdA8yGmqKS4FbHtHX9
 HBZaSae1d680o1gROD6tPLPzHOwift8BgogkbTSWsiITU4b8/ntl9UJOwgxG23w4S7bSNh
 vl3/VDl7lyZx6e5ojomZ0an5BsxL52o=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-wV7Krda2NVS1p2K0YRSmrw-1; Sat, 08 Jan 2022 10:10:01 -0500
X-MC-Unique: wV7Krda2NVS1p2K0YRSmrw-1
Received: by mail-oi1-f200.google.com with SMTP id
 p203-20020acaf1d4000000b002c660fc9a2eso6265172oih.9
 for <linux-i3c@lists.infradead.org>; Sat, 08 Jan 2022 07:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U169cYgO0bm4HCQJMyoMslqnpI+Gi+7C/va2IkqTrGk=;
 b=iUBpb1Tr7VCZBFzgV+tq5cwXo37g9VRvzlyufzNN/UtXjM2hOuzj+ap8iMFj9eXKzY
 jog037bF6DBUDOYDFNZmqd4yh1kpOgZpDJuLRQxHlaST9wNWBCgabbttN38/UuxP/bMI
 cQ4bNpcklvRkzQJTi+IVyZiZPeWDBdCHq7pFoKcb6RcmWgE1Z39+z0qb3/f/2Yw06X90
 DDiTgm8C8207FWp3fOhUytuH0f3Q5ZE8SDf3QcDPP5OUJDXTloOBM0Z6enCRMF02T3eK
 TRgjrvml+E0T39v71P/2YqCjCCHv0x4mIV3eJHc1+iNUnID8+wXsVYpYrTdsrGIkvbtM
 SYkg==
X-Gm-Message-State: AOAM532wghwizBv1kAJ0E+yBELI7gzJcD34C/qiUvNqiT1Ohz3b5eZN8
 /HaEYC+6E1+wuFayQpytYKwXHavojtic5VFs/UFoGRLx1KJ1jtudK4pryJlSTFh2ntVWK6VaoXq
 4uHKdfNlESkZ27jPkwydPpauRvQ==
X-Received: by 2002:a9d:d67:: with SMTP id 94mr47473296oti.156.1641654599569; 
 Sat, 08 Jan 2022 07:09:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRTLAixm2+kpq1Ek12ZorOxtE4fuJpDVvDT4q2xl3gRi5czVDxU4IDwGgLDNGQUDPeCsGqYg==
X-Received: by 2002:a9d:d67:: with SMTP id 94mr47473290oti.156.1641654599386; 
 Sat, 08 Jan 2022 07:09:59 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id c10sm371225ots.73.2022.01.08.07.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 07:09:58 -0800 (PST)
From: trix@redhat.com
To: vitor.soares@synopsys.com, alexandre.belloni@bootlin.com,
 nathan@kernel.org, ndesaulniers@google.com, bbrezillon@kernel.org
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] i3c: master: dw: check return of dw_i3c_master_get_free_pos()
Date: Sat,  8 Jan 2022 07:09:48 -0800
Message-Id: <20220108150948.3988790-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_071004_738194_D456744D 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:22:37 -0800
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
dw-i3c-master.c:799:9: warning: The result of the left shift is
  undefined because the left operand is negative
                      COMMAND_PORT_DEV_INDEX(pos) |
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

pos can be negative because dw_i3c_master_get_free_pos() can return an
error.  So check for an error.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/i3c/master/dw-i3c-master.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 03a368da51b95..51a8608203de7 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -793,6 +793,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		return -ENOMEM;
 
 	pos = dw_i3c_master_get_free_pos(master);
+	if (pos < 0) {
+		dw_i3c_master_free_xfer(xfer);
+		return pos;
+	}
 	cmd = &xfer->cmds[0];
 	cmd->cmd_hi = 0x1;
 	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
-- 
2.26.3


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
