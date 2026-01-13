Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF91D2F34B
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KonEZnATsQgl46qk1lupYi/kYkOq0n5Abrdd+EPgj9U=; b=gKyF7zjTi0Ydde
	6Db3vMsBupssecI9D5R+SR85melNV8BWvu6gBZDNDC4xw4QBrA673idMFtU/35sUoQvomjMnNQGeu
	iVkuH4AIfhji7YWsDYxN1KaQXlLd5vquWbOeCWAmiQUTgPaUI4/VKeIsBILGFAB9NTYjBAdZflsez
	9jRTQsHeXxY7ExxJ6FXOkDfae9DfD2136ScY+6BztZhi39JASRs5IUQJjDKJnPx244guvOU6Dl0np
	XwYww80sJVoge/tQtkDVttk0Qpnkp9dzdBp5km8TlAFF+KoiHj1TR/zlFZbTMjAG+ZuB2oTuS5lHM
	+/8La7Fsz22gEuMOmWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiKZ-00000007XfJ-0hUU;
	Tue, 13 Jan 2026 17:37:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiKV-00000007XeI-0ls9
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 17:37:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7AC624E420AF;
	Tue, 13 Jan 2026 17:37:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3921560701;
	Tue, 13 Jan 2026 17:37:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBF85103C81D3;
	Tue, 13 Jan 2026 18:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768325834;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=OJxzK/MKqiVL5VTqBfHItv3gvZE1Ow5ulqA6kP44mNI=;
	b=j5aQ/wBufw207PFwWrS6ajFYV+nxlGBgORNyQrbExIHvStpGEUzNyQN5xswy+9mt08aPer
	o0VNmkKuQSHdVdpRWQfMcW1sovpiSwuYxlq2RyFPKdopQEB+MmmJ63ZYYeTKHa4jpXpAko
	/0M71jO9Dxx+hsDY8RsiZz5KMo3wnSUpJOjbj7KvVCAU4PEx6hkpdx9E9pXXTZq3xZjPtJ
	fG5qg5nRw4xDRa1qgH8DYkSYr10OvjqttRgIpSjBi/ENM78eBD1jqpfcqGRVhpsQLVyVW5
	9Y7PFOZoAhVttmy3ZQ5oQepQAz9R3oWQ27OYSKpWYarql46+g57i6kp5nDnSPA==
Date: Tue, 13 Jan 2026 18:37:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrianhoyin.ng@altera.com
Subject: Re: [PATCH v8 0/4] i3c: dw-i3c: Enable support for dw-i3c controller
 NACK retry sysfs and DAT restore fix
Message-ID: <176832574309.1069340.7336876369609161397.b4-ty@bootlin.com>
References: <cover.1765529948.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1765529948.git.adrianhoyin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093719_380989_B363B6A0 
X-CRM114-Status: UNSURE (   9.23  )
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

On Fri, 12 Dec 2025 17:02:54 +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> This patch series adds a controller-wide sysfs attribute
> dev_nack_retry_count for the DesignWare I3C controller, allowing runtime
> control of the automatic retry mechanism when a device NACKs. Some I3C
> slave devices may temporarily be busy and unable to respond immediately;
> automatic retries improve robustness in such cases. Writes are clamped to
> the hardware maximum of 3, and the value is applied to all active DAT
> entries.
> 
> [...]

Applied, thanks!

[1/4] i3c: add sysfs entry and attribute for Device NACK Retry count
      https://git.kernel.org/abelloni/c/b58f47eb3926
[2/4] i3c: dw: Add support for Device NACK Retry configuration
      https://git.kernel.org/abelloni/c/ec17f1430948
[3/4] i3c: dw: use FIELD_PREP for device address table macros
      https://git.kernel.org/abelloni/c/4cd9d2bf0b56
[4/4] i3c: dw: Preserve DAT entry bits when restoring addresses
      https://git.kernel.org/abelloni/c/de28e002df2e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
