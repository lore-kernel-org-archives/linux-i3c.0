Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EECC10F16
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoEgUEOy3Ybd/IqmzNKNKxBTdsKiqjxfJCNIsMg3nIE=; b=uUUXf6g0qIRfPM
	Ple1RefBu2pMAiXkgsr1QoeXyISrqVVA1oCvoSbxAQajAmDLz+lIOOnKb5mkvTZESMEsBnBOqOZOu
	hz2oe9saCJr9mZ02TFovf9jCGGsKce49A4V0DtE2zPGEclNb1M3F4pJKYPSK8zWlmdH8AX5jJ2zvn
	oTEct8aNKvtl49PpdlYC7mFxt75yFQdiVRBQiV+CMepy1iGpzUsYUuLTnkaF0i2AZNzS9C8gNHQEO
	isyppezyCsiU+9TtdJfoIL9lsY/jw989+mGU9LXX95olKCuM2qg+pYB+6odDuYhWVyyomqfdoIJEw
	MzrqRogCIzqdAog6wFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3ygL-00000007Ww0-3OJN;
	Mon, 06 May 2024 13:47:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3ygI-00000007Wv1-3FoB;
	Mon, 06 May 2024 13:47:04 +0000
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B13A62009E;
	Mon,  6 May 2024 21:46:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1715003215;
	bh=2fhzb0hzM5CoC8a/Hka9EaoE507VJeZDLIbAnWrjUbc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bwo2UIIjoltuTMynVf0nfgO+i7rXvZ4kRTueU/ZTz4FjuAxtap4hBzajaFDed0WMa
	 kNpCyzWGAQmuISBjc32x5sOskt7mPcIUPaPbEV0wFzDEHuVCV4Ak26gDCnBpDt17sJ
	 O9FLFfdxTnW9TyBhVo6w1env8+YTqOcTYEYqVX+I+x5pbpBOEnAqAnJv+6K1oLeK/N
	 67xNd7N3f9C/AhtK3PK/J9F9dvTz427MH5CD8FSu6xY/qSVSzPLNfs0KSUayN/Y0S4
	 /EGKzAiakLl16imLL3GWlxPDZz/o4GqcbCqec+PSb9blfm3cwDtgdQ6RhJqBDNE1G7
	 kpmh4eOKIRqLg==
Message-ID: <42ec2da02cc1260fd1c05bdeb620f770c8ecc767.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] [RFC] i3c: ast2600: Add MCTP-over-I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au,  alexandre.belloni@bootlin.com,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org
Cc: BMC-SW@aspeedtech.com
Date: Mon, 06 May 2024 21:46:50 +0800
In-Reply-To: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
References: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_064703_040957_087AEB63 
X-CRM114-Status: UNSURE (   5.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgRHlsYW4sCgo+IEFkZCBBc3BlZWQgQVNUMjYwMCBJM0MgY29udHJvbGxlcnMgYW5kIGFkZCBt
aW5pbWFsIGNoYW5nZXMgdG8KPiB2YWxpZGF0ZQo+IHRoZSBmdW5jdGlvbmFsaXR5IGZvciBNQ1RQ
LW92ZXItSTNDLgo+IAo+IER5bGFuIEh1bmcgKDIpOgo+IMKgIFtSRkNdIEFSTTogZHRzOiBhc3Bl
ZWQtZzY6IEFkZCBBU1QyNjAwIEkzQ3MKCkknZCBzZW50IGEgc2ltaWxhciBwYXRjaCBlYXJsaWVy
OgoKICBodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL2xpbnV4LWFzcGVlZC8yMDI0
LU1heS8wMTIxOTMuaHRtbAoKQW5kIGEgdjIgdG8gYWNjb3VudCBmb3Igc29tZSBmZWVkYmFjayBv
biB0aGUgZHRzIGxheW91dDoKCiAgaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9s
aW51eC1hc3BlZWQvMjAyNC1NYXkvMDEyMjEzLmh0bWwKCj4gwqAgW1JGQ10gaTNjOiBhc3QyNjAw
OiBWYWxpZGF0ZSBBU1QyNjAwIEkzQyBmb3IgTUNUUC1vdmVyLUkzQwoKTG9va3MgaW50ZXJlc3Rp
bmcsIEknbGwgY2hlY2sgdGhpcyBvdXQgc29vbi4KCkNoZWVycywKCgpKZXJlbXkKCi0tIApsaW51
eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
