Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34FAC02181
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Jan 2025 23:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75LPhhE16h4ygXHQ0/E0mRwWJ8/KQpikpIUd/oRXZ7g=; b=QdiLLe4IFCxZM9
	Bic5UTPK3G1+B8k2WP7zepyjImAmdwakTLokglT0kgb2Hq5KlrOEHDOiSVQ2tGJ5B0QRS54exvFeM
	Y973TS2vIN+e8E4A7JrXKVfvnYyEP/OjrFDtMCtZk9GZDDz4irS+6puoRnYd16l9C9iGPzdkNNoX4
	yOH0eQvRyUzUuu6AZYvcnhH6t/ETG3C23/PyGC7ZFibFsoPgvRB+AD7hT4Qu1eXh6+M3QgNWhbehY
	evOC4+H2DugOno3+6HXnLMWSpNhMMnJmT0Yl0BTZimz3S5k3Af1rC9c7ylekb62MGpRnMPbnbpFgv
	xvHI3A2MhAoMfIBfq5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX71l-00000003aai-2qRK;
	Sun, 12 Jan 2025 23:05:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX70r-00000003aSN-1rcT
	for linux-i3c@lists.infradead.org;
	Sun, 12 Jan 2025 23:04:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97A85FF803;
	Sun, 12 Jan 2025 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJvkUMb6g/uBfBENS1zPUaPTa7o5KpUb/LvFy0cjtcI=;
	b=lsJUY/wga4oYDhAXCcOy2YqEYaP+1lGIVY4x5ozpcO2QfKS5vLNzTJNOfUDULxgunARuWb
	EOqdRCp3m/pEzaEF9fo8aTfXtfh0eRSJVvuY2Fe8KdUaQiEBhIwEIdw0yQjYem3fxDuJ0I
	AKkgHMwflYKGm3+2nvzAPmcSM8IVW5LS6rIpIjrixiv26U7bGlBOcpvQLxa7nSFBNUfz6I
	CeSD2a5Uodfd/Yz/TE6yJxhkwiR20BjVfrZZlJdrzzV/q6U7JKjTVtafWTDbrJC6hSXMLs
	oVSDDewU1M4IQc4MQUcxNdp/5W+r8x1AJJej3fGcvyn5j9kjYxFBn6Og3uyemA==
Date: Mon, 13 Jan 2025 00:04:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] i3c: mipi-i3c-hci: Add Intel specific quirk to ring
 resuming
Message-ID: <173672283104.1485431.7390433386683653278.b4-ty@bootlin.com>
References: <20241231115904.620052-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241231115904.620052-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_150457_610511_5B70BDB9 
X-CRM114-Status: UNSURE (   9.85  )
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

On Tue, 31 Dec 2024 13:59:03 +0200, Jarkko Nikula wrote:
> MIPI I3C HCI on Intel hardware requires a quirk where ring needs to stop
> and set to run again after resuming the halted controller. This is not
> expected from the MIPI I3C HCI specification and is Intel specific.
> 
> Add this quirk to generic aborted transfer handling and execute it only
> when ring is not in running state after a transfer error and attempted
> controller resume. This is the case on Intel hardware.
> 
> [...]

Applied, thanks!

[1/2] i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming
      https://git.kernel.org/abelloni/c/ccdb2e0e3b00
[2/2] i3c: mipi-i3c-hci: Add support for MIPI I3C HCI on PCI bus
      https://git.kernel.org/abelloni/c/30bb1ce71215

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
