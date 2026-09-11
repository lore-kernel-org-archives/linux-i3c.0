Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DA9C88E50
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 22:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4ABvlsvETVSl/R3LZROuZsy0OXe0xnbe+93uD8QI4k=; b=PmUc9BWIY49hKq
	/mkPd2erfhwROFpiofU7nhiKFg32TN9sYMOduTc9skO9h5Fim5Fp95kU1Gzfb/Yr/jao+UikSIhg8
	Rbu+S9vHiUFLvZD5GO0yD+APpMRvIcyfm++xuMgfv1gSVFwz5/88bfogBLYOqWaxcBKLW2scEVNt6
	4LjSbXYLKOqKKL2N4qds7fyDM/Es+fQeoYXEyZxbXSlX4SbRFS0tmDkEwebJp6/6zMewyOzSifzaZ
	cfl5KTnEGugzTjK53KBHDqNeF+vR82tqiQBX58SXLushedXC80LaLhbIk3w9n8GlvNSFzKPttQQB6
	CY1Fa3XiON4j1ktVcS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59OL-00000000EAO-36sY;
	Fri, 11 Sep 2026 22:06:41 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59OJ-00000000E9v-17QP
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 22:06:40 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 77CBE20B7166; Fri, 11 Sep 2026 15:05:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 77CBE20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789164356;
	bh=QfmiSG1WNXdPQTUBmk7di0RFlVWN/duAEE6OzJ0NA00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPfOnRfZAYQ295IrYtL6HCccKUA9Ojc+i341UL7OjmY0dtpSXiBq8da9GrrWzq/F1
	 ZMTttVsdlmytiqI/Er9opXjW6TOrIikVwQ8qu8MjqKOuhd9DSb9IEypdE3RwnzTojd
	 27rGqQHNvQK1/jfQBCp/mwEXRM0lenBAOuOYvbus=
Date: Fri, 11 Sep 2026 15:05:56 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org, tgopinath@linux.microsoft.com,
	boris.brezillon@collabora.com
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-4-samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_150639_329087_5B470361 
X-CRM114-Status: UNSURE (   8.15  )
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

FYI, I have an alternative design option that's worth reviewing:
https://lore.kernel.org/linux-i3c/20260911210935.1353126-1-meaganlloyd@linux.microsoft.com/T/#mcec3e06c911d331d5cd2b2d0a7f7169b5f9f044b

It follows in the direction Boris was going in the 2020 thread:
https://lore.kernel.org/linux-i3c/20200222093844.2f5ed538@collabora.com/

The alternate binding solution is:

If i3cdev match id table is empty, the generic i3cdev driver can't bind
during the auto-loading that happens on boot. This means we won't step
on the toes of more specialized drivers. Once user-space sets
driver_override sysfs knob to 'i3cdev' and binds the device to i3cdev,
it behaves the same as any other typical driver model-based driver. We
can also use udev rules to automate setting the driver_override & doing
the bind for any i3c devices found by the core.

My series also implements actual_len in the controller drivers and uses
it as an output for user-space to consume for reads. It also accounts for
maintaining compatibility if i3cdev_xfer struct expands for HDR modes.

- Meagan

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
