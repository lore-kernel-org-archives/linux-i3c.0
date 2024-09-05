Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20991CD5BDF
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2024 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANa5bGBjk3QRUBkAMFm5a8m/nui4d/42DOtJQfE+kZg=; b=1dV8cOFvjLBy1n
	7T9yrvy+qYsgizYzb1vW1QcotuTHLYTnNAvKoul3T0jEFh8n3hVF5KOT7ov+rxVuQREMeB0/dfSbg
	w7sRDjT0hNSa0dcVGSlOVrGXbl2+eo6PYFJmLDcRyLhNHaftNaez98wPReSmB6UUfyDL6IJIA8dgH
	55AuSMrN9FAKveBsNHBv8lPSFCpWEoZZNvd2bb3rR4bh3+FrDNu/eBtthrKAx7pVBs2mwjoMeIL/3
	j8E0WfHqqn56QpDppe7prUhv7pqpuAgCwAox+K4pEAYvza49rnQztP/Pl99ex+yRtk4grlojDXXTf
	UU33sECfG8kSb3etN4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFTb-000000099ec-2mW8;
	Thu, 05 Sep 2024 16:36:55 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFTW-000000099cC-431e
	for linux-i3c@lists.infradead.org;
	Thu, 05 Sep 2024 16:36:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 336DF20012;
	Thu,  5 Sep 2024 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725554206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PZPWg81TQVepbnRrJjZUDDDTRgMUgeM9ZeCBY0ZWpPk=;
	b=Cd65cSWtqy37uBkfY8G0npUNOL4FRm2rt7lkGrRdXz+8TqEJDlLmt0mptPBzjTv0rT6ZOf
	+XyAAq2qDLpXgaPzeKi3aUN+b6v3TD7Ojj8xKC6huAQCaC/eRjRY8KCX7nFyD/yecWxgAd
	R1D5KuufA0kNt84kj1bNTwx/rcB78UKnJVu2hwnhSwVNogF5hc3sAVTY9Gmivh2Q21hAEB
	gRXlQCX0I+gLkFEbrujphI38JQlX7zX5p3uCilrHtyMKZl5KDQiuTPPymhqN8PZgJZDr5h
	SmuiEMFNicBCPw9H/MuBCa25NLtuOLmOx27ATEIZ95+OQt+KODBpu1z6v0AQDw==
Date: Thu, 5 Sep 2024 18:36:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] Introduce initial AMD I3C HCI driver support
Message-ID: <172555419210.906626.5175587207944036259.b4-ty@bootlin.com>
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_093651_667271_F6AE91C5 
X-CRM114-Status: GOOD (  10.29  )
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

On Thu, 29 Aug 2024 14:47:07 +0530, Shyam Sundar S K wrote:
> The AMD SoC includes an I3C IP block as part of the Fusion Controller Hub
> (FCH). This series introduces the initial driver support to enable the I3C
> IP block on AMD's latest processors.
> 
> Currently, the code is closely tied to dt-bindings. This initial set aims
> to decouple some of these bindings by adding the MIPI ID, allowing the
> current driver to support ACPI-enabled x86 systems.
> 
> [...]

Applied, thanks!

[1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the I3C Support List
      https://git.kernel.org/abelloni/c/8d2e56ef83ce
[2/6] i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only after i3c hci v1.1
      https://git.kernel.org/abelloni/c/039b23609ff2
[3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
      https://git.kernel.org/abelloni/c/014089329953
[4/6] i3c: mipi-i3c-hci: Relocate helper macros to HCI header file
      https://git.kernel.org/abelloni/c/216201b3d7df
[5/6] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
      https://git.kernel.org/abelloni/c/46d4daa517e9
[6/6] i3c: mipi-i3c-hci: Add a quirk to set Response buffer threshold
      https://git.kernel.org/abelloni/c/ced86959d28c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
