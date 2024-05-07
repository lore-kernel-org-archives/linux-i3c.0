Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57307C10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaIV2qy9UlZghrg0Hp62GBvVFTnYhzJ4TKroYPMKRAc=; b=ceDF2f8/61tW2g
	6rkaJGHUAKh9BsKgbLtCSFQjZTcR/2KkXfAGpCnXK+SDva/UQLgvxblVgE+SN6O+7R7SGJV6NEyv2
	1A91kDaw19iq8SyLfNivbzNATgIhQvZYK1UX00uNX26OVo3dSyQPGPUSpMLLIYSQYNjuFAmLjKBmX
	TGvu41SIGVNbVEVePBXSvFaIkzb8rfJzFQAzmUxM/97gEeati59vAhgCwNgKqgvPiejqDuQYIxbbA
	ygfAvHxXS8inJFwcHenAAxcigFJznnl0uJ7gzAqSQI6ojcb4z/KLKTltZW6b4SAn7pXFOmAl8llfh
	hu0yh9TuRSbqtNEH55OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4S5b-0000000CrQS-3aTG;
	Tue, 07 May 2024 21:11:07 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4S5Z-0000000CrO9-1DMe
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 21:11:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0729960002;
	Tue,  7 May 2024 21:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715116261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W5ESSq2KvVPjsczAzIek0MhPysf96aqW+AbR1LnQtbk=;
	b=IVfcP88oUmXZ8dc9xbws7gHBC9icllDkT+qcUcu4ioKYoRMqRonFAMmkazSPBz/zfP3HdW
	LiZnpfi86Cweu+gNAT0CrJm3p2PgmZB4Wqdy2KA7gdI0wGD6FXVnNhfF6HEEMD8wU5/quD
	EtP71A33Xppe37v/RC3uzep6U/LmXQ2NH+B4lT/Mv9h1HzVhZ6u51GHQodbWMG9wSh93Am
	66T2jCo0CBj5O6l5AjnYOXvWzoViMALN3xhuXn4JAYWnJb+o9//shA2I0ZF7rGkvkbobRd
	brAwO3jHufNYYTPsa45tEUaIo99cHx1tApIyX1b3ShfzdKEwjkMakyCRWWJa7Q==
Date: Tue, 7 May 2024 23:10:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: dylan_hung@aspeedtech.com, gustavoars@kernel.org, keescook@chromium.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH] i3c: dw: Add hot-join support.
Message-ID: <171511624412.989201.16500909870135488623.b4-ty@bootlin.com>
References: <20240429073624.256830-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429073624.256830-1-billy_tsai@aspeedtech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_141105_622019_49B34671 
X-CRM114-Status: UNSURE (   6.85  )
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

On Mon, 29 Apr 2024 15:36:24 +0800, Billy Tsai wrote:
> Add hot-join support for dw i3c master controller.
> By default, the hot-join acknowledgment is disabled, and the hardware will
> automatically send the DISEC CCC when it receives the hot-join request.
> Users can use the sys entry to enable it.
> 
> 

Applied, thanks!

[1/1] i3c: dw: Add hot-join support.
      https://git.kernel.org/abelloni/c/acec16dbb338

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
