Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64372CCF9E3
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Oct 2025 23:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3mx/KtQS7zXz5M96Re+LMm6msXonWzpssh/yZdHnys=; b=Fm/oZsyD4DmBJx
	9U+H8R4gW91804U+ep+xnhaGo1bOyZa9vpFYPyc6IYwaDZQAvS14BanbqiTOY/GV908xGv5a37L/B
	WBtAO9aZRWTeI54AcCEF4qJK6ALHvnLXyjLMByEEigrSYILA9iWwlc8HlyrCPK6/1zxzIB1QrGD7E
	tpBsljGuzElpnFif4L/mFNx2z+E7ecwwZ7bDPZ4o4wLpAFMtWnUL0jv7LAeYV2zM0092L3oRgTq+0
	O/Rhr7XLNJO/CUVkF5skQWe0o4zvYlKh4pcJ8cOX0rLQZDBp8iJcDfF8/a6W1K5JiewLzuVsCkLT2
	nbnk0f2FJMjdu7YggbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcJ4-000000059cX-05Fp;
	Thu, 30 Oct 2025 23:43:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcIz-000000059bw-1YZg
	for linux-i3c@lists.infradead.org;
	Thu, 30 Oct 2025 23:43:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB0FB4E41406;
	Thu, 30 Oct 2025 23:43:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7EADA60331;
	Thu, 30 Oct 2025 23:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D03E1180CD93;
	Fri, 31 Oct 2025 00:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761867820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7xAYHK3it1+6qqe3o8nqRfZAVs8VSB3PxQiuuoM7amY=;
	b=ITROjdTedUGq3gJUgqHH6S0De7ydtsZ4r1VhlIH2qPzMWkz+vHFO/TkJ1hgie+Y3k4uvJr
	egoxyNdfMqIJMS45n19uCAmp6HYhx1UfvwwDw7nZYv0EqyBN/WNFZ3cylATjTr61Ck5Eq1
	sS6ADz5V3dSAMa0LHiC9Wm2MIOgYgtW4erM0xIWJ2ngsCPoiLtJcY0pzSBVR9lFVjNQkIL
	rCTIl1nr+DGa2Ex5fbTIsGL45Xq9IxrsnljtPWTD5qEQvqSgrjdn9Wa9oZIFga4Ocm5DYz
	q82r9jeZSKEth6Anxh4Y1hcIG2rB/T+3RveGCpyXLiQmuHYNSTpgTFECo8H3yg==
Date: Fri, 31 Oct 2025 00:43:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] i3c: fix refcount inconsistency in
 i3c_master_register
Message-ID: <176186765078.475593.5246237578344242065.b4-ty@bootlin.com>
References: <20251016143814.2551256-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016143814.2551256-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_164346_142015_78030838 
X-CRM114-Status: UNSURE (   6.18  )
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

On Thu, 16 Oct 2025 10:38:13 -0400, Frank Li wrote:
> In `i3c_master_register`, a possible refcount inconsistency has been
> identified, causing possible resource leak.
> 
> Function `of_node_get` increases the refcount of `parent->of_node`. If
> function `i3c_bus_init` fails, the function returns immediately without
> a corresponding decrease, resulting in an inconsistent refcounter.
> 
> [...]

Applied, thanks!

[1/1] i3c: fix refcount inconsistency in i3c_master_register
      https://git.kernel.org/abelloni/c/9d4f219807d5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
