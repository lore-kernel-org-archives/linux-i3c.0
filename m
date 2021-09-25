Return-Path: <SRS0=7s5Q=OP=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222E8C433F5
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Sep 2021 21:20:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ECC761041
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Sep 2021 21:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6ECC761041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldkmM56zEfpCvCOxLWEaXRepb1/bejdulLuttN6Yrow=; b=UBzLXf2SvknTT7
	3bZm2nD181djIei4seqsJhJCVei2RSfyAN0FrzhLu3+nPEBsMyAGrOyZ9uHx+iTIW+nI6BtHNIoLq
	rkgqAuwkPo7wCgan5T37UVbIir/0EETnxYLPYblSDXZITyz+RkCSl0ZMIVsWgUPF/vpGbsKKiF7Lp
	4/FcQm0NGs4TkPaTtCqKSU1BrJvVROsesKQe/4PgGP1gjef2IoaqWgG00INHtI30egqq6zOtfvTnn
	HJbkJ7jyVkCeP2CianjciLeogxBp6kqSlHoA8f51DOnp0fq9zLP/6sFIh/k+nFicgo9kQYOgXv2Xc
	qwC7H27leyRvnhJsOnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUF6C-00HGeV-N3; Sat, 25 Sep 2021 21:20:44 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUF69-00HGdr-0U
 for linux-i3c@lists.infradead.org; Sat, 25 Sep 2021 21:20:43 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 40D00C0006;
 Sat, 25 Sep 2021 21:20:33 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jamie Iles <quic_jiles@quicinc.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] i3c: fix incorrect address slot lookup on 64-bit
Date: Sat, 25 Sep 2021 23:20:32 +0200
Message-Id: <163260482181.35531.11212519541785453670.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922165600.179394-1-quic_jiles@quicinc.com>
References: <20210922165600.179394-1-quic_jiles@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_142041_230996_11070B15 
X-CRM114-Status: UNSURE (   7.54  )
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

On Wed, 22 Sep 2021 17:56:00 +0100, Jamie Iles wrote:
> The address slot bitmap is an array of unsigned long's which are the
> same size as an int on 32-bit platforms but not 64-bit.  Loading the
> bitmap into an int could result in the incorrect status being returned
> for a slot and slots being reported as the wrong status.
> 
> 

Applied, thanks!

[1/1] i3c: fix incorrect address slot lookup on 64-bit
      commit: a3587e2c0578101900d4abbbd72ab3dad6d5568a

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
