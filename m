Return-Path: <SRS0=0GSa=ID=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8BBC433E6
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Mar 2021 10:01:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7638A64F45
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Mar 2021 10:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7638A64F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUmt1TfGf8/TK6FgcRlDU3c6ai9RPnudfxrCD6y+BzI=; b=S2hVBOLU8SJsJdH1ASyIaSYj4m
	bRIaqPdXNfthmxO6hrJ+7g9/zx+maPXfUnqixGwB0sn07tJiSwAtq/cycl6FRruPYdsM97Am0PqxT
	m7kEOegZJbzbcfYI/zF9TZOqrq5nTVis5BnUIMz3MgSdHd4/uufTixN/bB5MVTIxLXcG/supQONwI
	8WsbcJhoxqSb6pyVCOD6HwzEsIKGua+S2TxQ+VnL5407yY2fxqh7SsPmB2VRh6DIV6eFJZLjQHbGh
	MVKkC3SjV1HkBI8CQGCWnRwhRz+oTKuQjPrgY3qru5Y3djM0e8utQzzpuoswEpA68K7A4D/YZYQIH
	GTOX4EwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI7H9-00EQUH-4S; Fri, 05 Mar 2021 10:01:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI7Gx-00EQQc-FH
 for linux-i3c@lists.infradead.org; Fri, 05 Mar 2021 10:01:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 913BE64F45;
 Fri,  5 Mar 2021 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614938486;
 bh=/KDY4J07mjjm5lcTX58j7+USUutizIZZ0ViN5Kxbmkk=;
 h=Date:From:To:Cc:Subject:From;
 b=Wba0wyn23FVcRoRG+6PWHx/1pKQ+xOMbXdSPfMQozz2ZN6Ybn7J9AVOAwIzSxT/nR
 KcjIAFeoqDs40SRiX14JUZKP50pErfkSzJynvaG/+1hE4S86h1M0p/GE9Ph6oNvN23
 i3X+hM6fcNj2i7NPpr/bMmEOGdEszw3J9M5cst/qese7YyEC73+grywUljKG4qXuPM
 /pGk1gl0xptwcxhdXsVa+fWaDAvpNCRkkg+50c63PoTTyURd2Qvk551nxXJ3D4lhyr
 bIlzbf+OaVF3ZHpFGQhZqn4nrRFavdm3T05Z4foQw2v4JCsQTA6fCY/PKZUdF6DxCM
 hEkdDsioq1wCg==
Date: Fri, 5 Mar 2021 04:01:23 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH RESEND][next] i3c: master: cdns: Fix fall-through warnings
 for Clang
Message-ID: <20210305100123.GA142484@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_100127_749614_7DC2E049 
X-CRM114-Status: UNSURE (   7.50  )
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/i3c/master/i3c-master-cdns.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 3f2226928fe0..5b37ffe5ad5b 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1379,6 +1379,8 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_MR:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
+			break;
+
 		default:
 			break;
 		}
-- 
2.27.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
