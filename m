Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27B2C001B2
	for <linux-i3c@archiver.kernel.org>; Sun, 11 Dec 2022 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfhlch0Aips6oAZHE/tKlG38nKy7nzenbxQmQf4iElI=; b=mbQk/rMCXxQYLY
	0o6ArKk5EXVnMNXY8CXpQXY2d6yS99IpmMVtW2EUHbGVIrXJEs6u5Cjq4MgQvrPqIsrugJwVHJ9JH
	G1XxPfKbOtTseFDszJHa0s7zY0Qum4FatJgkS7uXnNjE3InsSRcvyPmNJO7QUTPc29bQUvlHAvtWa
	egliUVAZwQ5AGaadquXrZXbkCYv9wq4FMpYYOrhHo3NwSxNq271eWol/4l7JsDzfet4iB1DIkZoUM
	ftlvgXx6raLmkELZNNLPufZBqxmg3i1paKz3OYJ9w4nMr8Pq5w6fAczY9OUyRW0FPzs4sG1D81m79
	Rq86n5C+coWQ95QKTFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4SxB-003yBO-0P; Sun, 11 Dec 2022 20:29:41 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Sx7-003y56-Ew
	for linux-i3c@lists.infradead.org; Sun, 11 Dec 2022 20:29:39 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 79451100002;
	Sun, 11 Dec 2022 20:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670790572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aenmLYSaueVuHHm3ZGdyynlhDziBV89ECrB6pS619oE=;
	b=K5nSiGj+w03kznIe4Vt/Bnq8KcsIXtrAMY9XJuvr/LjBke+ag8ISwW2vTbXlhwNUv6QNva
	x2+1wy0Loqrn7+V2IHqSnB7upF/Ppr/2apvCnlCkueRr8POYYFKz7+OtPy/AyKhExvjw14
	OsFf6guopliUWfx851eWundkp9i7PNBE7fKm38GqGmdSKmRfVkjw0/rfkWBBVQVvkH+kMx
	CSpXE1kAG6ic2XLljVBD7Z7VFT+MS3havXHvytMNdwSf2fJDuKJlwhf6LNK/6VJ5H7W4mU
	0roTMIzJvnGRWwHzWzYjusTv6lc1W8YTRGYhLT29Y4TGiHgpdVXmc8L+aKgZgg==
Date: Sun, 11 Dec 2022 21:29:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jack Chen <zenghuchen@google.com>
Cc: Jesus Sanchez-Palencia <jesussanp@google.com>,
	linux-kernel@vger.kernel.org,
	Mark Slevinsky <markslevinsky@google.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] I3C: export SETDASA method
Message-ID: <167079040326.15858.302543275649765579.b4-ty@bootlin.com>
References: <20221207205059.3848851-1-zenghuchen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207205059.3848851-1-zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_122937_653545_65784BDF 
X-CRM114-Status: UNSURE (   9.13  )
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

On Wed, 7 Dec 2022 15:50:59 -0500, Jack Chen wrote:
> Because not all I3C drivers have the hot-join feature ready, and
> especially not all I3C devices support hot-join feature, exporting
> SETDASA method could be useful. With this function, the I3C controller
> could perform a DAA to I3C devices when users decide to turn these I3C
> devices off and on again during run-time.
> 
> Tested: This change has been tested with turnning off an I3C device and
> turning on it again during run-time. The device driver calls SETDASA
> method to perform DAA to the device. And communication between I3C
> controller and device is set up again correctly.
> 
> [...]

Applied, thanks!

[1/1] I3C: export SETDASA method
      commit: 672825cd2823a0cee4687ce80fef5b702ff3caa3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
