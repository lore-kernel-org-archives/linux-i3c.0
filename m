Return-Path: <SRS0=+5ps=IC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B165C433DB
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Mar 2021 17:42:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09F164F4C
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Mar 2021 17:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09F164F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6vpamw3NOoTaT4hhfwBRUKqNmLK2ozFgZ1qCRjczvKk=; b=WcwantHJ1gqad6N0WQ5F1GVRx
	KC391wow0ZFhtMTACuCLXWtQTB2P89ZCUsm9wsGfQ+7fCCKoaZxzgjb1jSAyVMViiyfiismHYavyA
	cAkEJzLhHhaOvkLBgM/KDS19ZmRc87vLXz+QI5TcFO3Pck666RacaSB2j8F55bDxBF0IqRvcEt30p
	RIDTCGyqekKYdLf6vatKDuegc7GjG4EwE2M0OFDLwKevpYOYj6o5VgQE/LxZWIventAKMMKMWxfXf
	MLd8FIqNsMyAgfhWz2cUUkIYfIpsbcB8M7iLlO4/W4XWGwixC48G9P3KUW2DIAc9GUON4ASR9B9x/
	eqH2hsxvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHrzJ-009Syi-4n; Thu, 04 Mar 2021 17:42:13 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHrzD-009Swy-NJ
 for linux-i3c@lists.infradead.org; Thu, 04 Mar 2021 17:42:10 +0000
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C8DBB20005;
 Thu,  4 Mar 2021 17:42:04 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org,
 Conor Culhane <conor.culhane@silvaco.com>,
 Colin King <colin.king@canonical.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] i3c: master: svc: remove redundant assignment to
 cmd->read_len
Date: Thu,  4 Mar 2021 18:42:04 +0100
Message-Id: <161487966787.3455951.17740404517515431971.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224151349.202332-1-colin.king@canonical.com>
References: <20210224151349.202332-1-colin.king@canonical.com>
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

On Wed, 24 Feb 2021 15:13:49 +0000, Colin King wrote:
> The assignment of xfer_len to cmd->read_len appears to be redundant
> as the next statement re-assigns the value 0 to it.  Clean up the
> code by removing the redundant first assignment.

Applied, thanks!

[1/1] i3c: master: svc: remove redundant assignment to cmd->read_len
      commit: 437f5e2af73081ec08ec5d73d82c650377a4bb17

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
