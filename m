Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49551C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eBd8hk6LfQUkqLeJMsBr5l1CiHxTAsQ6p6A6m0YYCI=; b=EVXBmMTbVLgfp4
	3A4Wx/ayDciPFTLXYjcw2bMflsBE1trSWCZVFDP3A4CujK3IXARjPKX4Jp+ioIK8MfTG5g3dcz8Aj
	ygnqaImrvjz0/APbET2DdJyO//bqiDzOACNmPoEZKhfa8+LQDTNGn+GWZT+/dgefaOhr01fJKRWA+
	5gZwn5Am/Id82WBKcNYOq1tsxEOTkTuotihXzb+A7WMfvTpaGMbqZqKcevWdIgabwvqCXvjpmzQ9n
	acU8hlatDk+Usg4VAxVCJaVu7ajrJrMNp8AgWMnovBj36B6AyfUIr0ZvfYKUZihogV+3s0Q6geHCD
	wgxI7NEQRB0QcNJLUkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryAM-00000005uOC-49c5;
	Thu, 06 Aug 2026 13:29:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryAL-00000005uNz-3c53
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:29:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D3014075B;
	Thu,  6 Aug 2026 13:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345351F000E9;
	Thu,  6 Aug 2026 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022985;
	bh=dO6VxnWdSF/0UJe+1zjPxSzYZsu4rRGg353uds0O5gE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPFu9vhCDTnxdtuNbdPvnC7d8cBUGd4TTF/MmcSPjMHZppSMXddtEh0fbh2FdmB5t
	 EKlf7MSSpVMvZlecRsfk/rQBmpcf2Lt/X5YajFUFHLFoxW/CG6FstAJ8zbauE/VQeS
	 8aW5415KGfzhvRp2qIguW/eIyCwzZl3i9uIvEnusUoy2JmsNj6M6G1jPffOomdqD+I
	 zY/zmQY7XxfTC06PkAkgKl9rdbsS0aSE1RAhcGSKzSmrJE9m7GbEPPxU7Bqyfb7jZm
	 3MGyis0U/jnjqIn052gbcm8xduD+eaiu8fHLkuf1SPGoFCz9VDfctJk4yFlU6udynW
	 e83NFyDqT3E9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 10/14] i3c: master: Add helper to query bus wakeup
 requirements
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260806131857.119830-11-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-11-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:29:44 +0000
Message-Id: <20260806132945.345351F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

PiBBZGQgaTNjX21hc3Rlcl9oYXNfd2FrZXVwX2VuYWJsZWRfZGV2cygpLCB3aGljaCBpdGVyYXRl
cyBvdmVyIHRoZSBkZXZpY2VzCj4gb24gYW4gSTNDIGJ1cyBhbmQgcmVwb3J0cyB3aGV0aGVyIGFu
eSBvZiB0aGVtIGFyZSBlbmFibGVkIGZvciBzeXN0ZW0KPiB3YWtldXAgYW5kIGhhdmUgSUJJIGVu
YWJsZWQuCj4gCj4gQ29udHJvbGxlciBkcml2ZXJzIGNhbiB1c2UgdGhpcyBoZWxwZXIgdG8gZGV0
ZXJtaW5lIHdoZXRoZXIgd2FrZXVwCj4gc3VwcG9ydCBtdXN0IHJlbWFpbiBhdmFpbGFibGUgd2hp
bGUgdGhlIHN5c3RlbSBpcyBzdXNwZW5kZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1
bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlz
IHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNjEzMTg1
Ny4xMTk4MzAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTEwCgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
