Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A35C433FE
	for <linux-i3c@archiver.kernel.org>; Tue, 17 May 2022 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rofQio//yT63V8V9eAno4R47RMAGN2IC71bDFHvGxhs=; b=GmmPgc3VRvatjQ
	fMRbnSNuWPAwYyJZdbxW2CMkAIfrrLW7Q1C1dlIaqb5tn7yvAPkLRXEZc2ZAY6hGkbd3mZeD0Y1KA
	yUUWKTCo+5E+4RjWl9YqRWG0NetKlargdEHW1DWcwUYsijkZUjfLw+QqMb9lUBkfcI0CoU/DRZoat
	sJ1f6oNqtvTmA9afXZSBIdrU0D8izQwETE3GsGvz3BXhKM6An+6vF6e7cp7D/ekKWEW90SyLFp58W
	69HX2dTVj1FIs206vndWlFew9+j/bH5poAy8okpHYRBcfvSnjPIG8CMIkWZbGwsrCfa7249rWC+Y2
	m1dnyDKIiH9LLSwVHAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr3vx-00FmJy-NE; Tue, 17 May 2022 20:36:45 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr3vu-00FmGY-Jc
 for linux-i3c@lists.infradead.org; Tue, 17 May 2022 20:36:44 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9ABAFC0002;
 Tue, 17 May 2022 20:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652819795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EI7PEHSkI38zkHnnviCUHUxaVjTwrR3jSR8DYXJiRv8=;
 b=VznX2Lo+Yt/7ysaOynEJlVykuwWAF4PCpfkT1YkiciOXMFUMp9yb5Pi3jm0Z1qhb35AO5R
 ftWfhjzAvPvk11vVp5x80N3WoZ77klTkZV+5EUuU8lhvhtShPZOxQAsodH68gePYPd7Nou
 RQzHsb53K/IbRJ6Xg4KYEOywcq7KWplsaCfkjE36EU2lJYhoDtHCN7NfdQlkQ1355JNuD5
 by3QzRijSz0GW6eF8o+kQCphBHEB63UYBnnxkwpDAYiYsyoeUuTewY6jibML2xb81tYca0
 UvT9riwm8ZiuIhE+HTS9OgPZvvc5RWafd3aNcQ0gQrMHtQYs0BRM12zMZvGyfQ==
From: alexandre.belloni@bootlin.com
To: linux-i3c@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Guo Zhengkui <guozhengkui@vivo.com>,
 Conor Culhane <conor.culhane@silvaco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, zhengkui_guo@outlook.com
Subject: Re: [PATCH] i3c: master: svc: fix returnvar.cocci warning
Date: Tue, 17 May 2022 22:36:32 +0200
Message-Id: <165281969191.286793.10937391190514644254.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220504164901.9622-1-guozhengkui@vivo.com>
References: <20220504164901.9622-1-guozhengkui@vivo.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_133642_817779_0BF508B9 
X-CRM114-Status: UNSURE (   4.75  )
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

On Thu, 5 May 2022 00:49:01 +0800, Guo Zhengkui wrote:
> Fix the following coccicheck warning:
> 
> drivers/i3c/master/svc-i3c-master.c:1600:5-8:
> Unneeded variable: "ret". Return "0" on line 1605.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: fix returnvar.cocci warning
      commit: 227fab1ee7ca70c9b4b0915898e81327aeb70414

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
