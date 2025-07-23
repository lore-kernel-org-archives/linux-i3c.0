Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3229CC83F1A
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Jul 2025 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=js8jgog4ei1+faQSJyJzriJaFm3dpsTQ7HOOy6P2Rpk=; b=30HgrFY+6pb78P
	bKJqLMLH5T/365VYk+6BLaF3Wum2c6hvnvGdbOcJ6XzL+pE2eb7r79qehXAWyXzEEErwmcXMCbwNX
	gDK/GeMDcalr9YG/pS21rUS9AQ596Qoc95OCgy7L1GRW+JWhRZRRhkufYqfDfMGkvK/PV5FCmlcx0
	P7CefWV4OvJxcgZVtRyXXaofB6Mgcn+G0053DQsRgZjo8vLgt3L41eKLoFiZ1rWKqwzen9yZpV56a
	vvas22cnjhWJAoqMl04eYCY0aKIIHeXc7Csu4D+ac6POlIiWu9l2CK0yJO9+epGSASIbnj0Ko501b
	Gn9kGkN57OelcQi0D+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehW9-0000000616H-42Ik;
	Wed, 23 Jul 2025 22:00:53 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUnX-00000004Mzb-0L0c
	for linux-i3c@lists.infradead.org;
	Wed, 23 Jul 2025 08:26:00 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso5159335a12.3
        for <linux-i3c@lists.infradead.org>; Wed, 23 Jul 2025 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259158; x=1753863958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=DFT1ZCJHMZcPYrQJQzRnqa/m1n+9S/2uoZv3KXxjY1B6ZS6sc5vXurJiiQ+DrQLBKP
         ajWZgcrnUPHZoa1lkxeTvTdHRfcyRsqyf0+5uXYbMI5UcEP0RVKX6bKyfMCdA6sH3oXl
         tIwMKpyMyYQ2gvKoozvIO4KfXyv9Rs8q2IVnJWEaKJmdkfmpw7XIfbW+HLgUnrYucx2K
         Gu9b28N5yfup8su49Wrd+e7TzCCCUkJNdwiNfKDDtk8QMXfy6qTdkg2yAsD4AwG7G2My
         mlh8UScyDjf+iPQrYwWqWyRG8iYgPz5p1X+5+03Ri1h4UGLRtJkz7oiYoUMeTCIdOEGB
         G2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259158; x=1753863958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=gK8N8R6td6P6IJOSclmp+TdTB/DQy/2jeDB3Ek/Fpd22iyYAfDbvbbuRihb3uhRVqm
         jAzqaqzKwG3DRL6J9YbmzribWg/srxfZ5IWGKJspulNOcQg19kCK2KPK26HejMSa5rX+
         GyNmcbZQuwFjXUxIrQgrUYTz/8zU29opjYGby/g13Zpk3yD2a7cObA+S+OxJQ0qCY7o8
         8mTIjRU1vb4Z5EIonbimqLanY4D0i+zx9V3ZiDV2q2RAcW1Y/p6zBj2/XesX4FOXZ1AB
         Up9bYkJQdprCAyTn2Tf9C1J0o/1gQJdQ4S0w2PYArHYEwPO+3MleZLVgBTzaPJZWTnLf
         nXHw==
X-Forwarded-Encrypted: i=1; AJvYcCWo3NLRX8EAMq+s4kI8iPZ3oV0TlpTDNfJC+abdzBUeYyf/BhTO+UAodB2eTahLGhH1Tb+TVhRMDRc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4BlQR7mmvkF00FTzZ8vixfjfPRDCzP0C7LcqBg/Xuxy8J2HXp
	uuP6wvZzsCFLy9rPBcPi7PwhQZdetsnk8g+5OJXFh5YDVb0ORn9BSjx7nkojGuOKpvwtdoH4H1I
	ngBmQWhshvpcikevAMrD5f60cqyUIDFcEoJxwuSkHZw==
X-Gm-Gg: ASbGncuPlXx1wE4jbx15aTUYSZqzQDeP0leX3NBtVdzvX5NhmYucqfN/XF0p5Q2faMZ
	ex4lo5n4c4H37MG6zT+FrzrJgxGePe/yILwguRBSoQYs80GdZDFSdHpzYID4t6rhnmOCoRcI3h+
	YwkndvSqtbRuHjuUaMOVZE4ui6aNAIYS2tS84uhDP+p6WEFMzEfXcK6M1FzIJ2d6aRRdQ2Wiz5n
	62LxY5OZATJvQPHBpppF+fT6OV+2lKoRwKDGZPI2kA91dxw
X-Google-Smtp-Source: AGHT+IFzwCafFosCdx131zbcEFY3D64m+7mo0loj5vAsYVkMFUgy5UAHuuRGjg5yAkxctR2cI5zO8+e+kqhHgdsFxCw=
X-Received: by 2002:a17:90b:53d0:b0:315:aa28:9501 with SMTP id
 98e67ed59e1d1-31e507dc7b4mr4498294a91.24.1753259157929; Wed, 23 Jul 2025
 01:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:25:43 +0200
X-Gm-Features: Ac12FXyLbBDcOzrp8fBxUqR9jIu-gUOTaGAF4LxjwERQBqGacqdoGbliH_T9iv8
Message-ID: <CAMRc=MdFoAa2omJgL__4mRqX5CYyhZ3VU_Uy-Tf1oPSuZdV93g@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
	linux-i3c@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_012559_186268_19B14780 
X-CRM114-Status: GOOD (  12.13  )
X-Mailman-Approved-At: Wed, 23 Jul 2025 14:59:09 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgMTA6MTbigK9QTSBIYXJzaGl0IFNoYWggPGhzaGFoQGF4
aWFkby5jb20+IHdyb3RlOgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEhl
bGxvIFNvQyBtYWludGFpbmVycywKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgaW5pdGlhbCBz
dXBwb3J0IGZvciB0aGUgQXhpYWRvIEFYMzAwMCBTb0MgYW5kIGl0cwo+IGV2YWx1YXRpb24gYm9h
cmQuCj4KPiBDaGFuZ2UgZnJvbSB2Ngo+IC0gUmFuICJiNCB0cmFpbGVyIC11IiBhbmQgYWRkIHJl
dmlld2VkIGJ5IEtyenlzenRvZgo+Cj4gQWRkIHNvY0BsaXN0cy5saW51eC5kZXYgaW4gdGhlIHRv
IGxpc3QgYW5kIHNlbmQgdGhpcyBzZXJpZXMgYWdhaW4gYXMgcGVyCj4gc3VnZ2VzdGlvbiBieSBL
cnp5c3p0b2YgYW5kIEFybmQuIFRoYW5rIHlvdS4KPgo+IENoZWNrZWQgbG9jYWxseSBhbmQgYWJs
ZSB0byBhcHBseSB0aGVzZSBwYXRjaHNldCB0byBzb2MgZ2l0Lgo+IChnaXQvc29jL3NvYy5naXQs
IGZvci1uZXh0LCBjaGVja2VkIGNvbW1pdDogN2RmYmYzMTc2ZDg4NmZmOWEwYzc3ODY5NDJkM2E4
OTgwOWQwNjQxZSkKPgo+IFNvcnJ5IGZvciBsYXRlIHJlcXVlc3QsIHBsZWFzZSBjb25zaWRlciB0
aGlzIHNlcmllcyBmb3IgdGhlIDYuMTcuCj4KCkkgY2FuJ3Qgc3BlYWsgZm9yIHRoZSByZXN0IGJ1
dCBkbyB5b3Ugd2FudCBtZSB0byB0YWtlIHRoZSBHUElPCmR0LWJpbmRpbmdzIHBhdGNoZXMgdGhy
b3VnaCB0aGUgR1BJTyB0cmVlIGZvciB2Ni4xNyBzZXBhcmF0ZWx5PwoKQmFydG9zegoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
