Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D372E77188
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Jan 2025 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxrfS3QhNj6mIpiuFU/Mn8shRQGzlEqBGsQSQRQpk+E=; b=Q9fSJ0hFjS1umj
	RAz5AyCNXS2wY54ryuzDPAvy5qw36f5jgmPw3sHRY7Tl7feIQUzqCHcF3cDGifado5LSRzyfxDMxY
	JbWf4RCWUPZVdVhkJew/YxZz3oV1u0RUjEVL0HdReiz9s/il9lr8j2WhG6YjLbV0q2KwEcU1mZMui
	Kk5xTVhbX/Nwy0V5+DqThvlj5rwV0kHkTc0ASIXZAoXTT7VKhdknH9kaDQ6Ew0WBKRv4AxrHs8OF1
	Uvp/F8I6Ut+LYxpm8saVlQ+7vA3z9gS3FjN1US0BT7eShYpIaYOTUpeJY/DJtsxh90jowbzUgU7jK
	ZXVDZFZ/r2YPoqThLsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhNH-00000000O1N-3KFR;
	Mon, 06 Jan 2025 07:18:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhNF-00000000O0T-1u81
	for linux-i3c@lists.infradead.org;
	Mon, 06 Jan 2025 07:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63DBBA410A4;
	Mon,  6 Jan 2025 07:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9656AC4CED2;
	Mon,  6 Jan 2025 07:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736147884;
	bh=iCVBAmDJGuQ7L0qb4KshnfccErTrJX4g2OYIbINxqeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCnrcnExF+LX/CgvwTY/2oO3QCdf1kR7os6yKPPp81iJTJg5L7AOSULhMNGlceZhu
	 b3zajNkCxLACuWHJWKssGxwgMPVu9aqvoazp04JeGzS4E/Gb2m2sim/YFYOnKe++yl
	 1RdSTcwQuKIKPKwmjbbAgqleVyI8NE1FOJcmoSgM=
Date: Mon, 6 Jan 2025 08:18:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jianqi.ren.cn@windriver.com
Cc: stable@vger.kernel.org, kxwang23@m.fudan.edu.cn,
	alexandre.belloni@bootlin.com, patches@lists.linux.dev,
	pgaj@cadence.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y] i3c: master: cdns: Fix use after free
 vulnerability in cdns_i3c_master Driver Due to Race Condition
Message-ID: <2025010606-startling-cushy-d79c@gregkh>
References: <20250106022939.2197708-1-jianqi.ren.cn@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106022939.2197708-1-jianqi.ren.cn@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_231805_566133_493A878D 
X-CRM114-Status: UNSURE (   6.90  )
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

On Mon, Jan 06, 2025 at 10:29:39AM +0800, jianqi.ren.cn@windriver.com wrote:
> From: Kaixin Wang <kxwang23@m.fudan.edu.cn>
> 
> [ Upstream commit 609366e7a06d035990df78f1562291c3bf0d4a12 ]

Again, sorry, but no, I will not take any more stable backports from
your company at this point in time.  Please go tell your managers this
as somehow the previous emails from me seem to have been ignored.

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
