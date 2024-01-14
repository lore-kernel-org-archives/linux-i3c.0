Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705C4C4707B
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jan 2024 22:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xbSbJMj1l8FMxZilmP2NC8A40j4uRffEVwCR/FdY4AQ=; b=QLQlHBcbIMTOl+
	0HHcR9yF98gLDlvXE/yNVYgFEGrAgY0Gx5lS1vzaPoHZiPQDmnZJZ2YYYLjXQy2OfY63XW83av70W
	YeNCmjbMagAe5Ba65fVQV9hVU2gCxaAmJlCPP2klZ3nn6OMe1SKGFnlz2+giKmroUKd7D8d/eHmVB
	147Yp4GWKYrpNsZU0bdug61a+OWaSAiaBo1Puj/PFikYTMOi3zWgXoFcM0dxW/l9jqpRXsR6z2cA6
	tsOYfQfqynm2wVJYlq1KDac3bHDyyRTds5DiKLWlIwt10mPgVjLpaCbr/JakTJZSSMVDZ5KA9ugeL
	ISr06dRepdfks6fppDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP9LY-007Svw-1T;
	Sun, 14 Jan 2024 22:52:52 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP9LU-007SuA-1w
	for linux-i3c@lists.infradead.org;
	Sun, 14 Jan 2024 22:52:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA69440002;
	Sun, 14 Jan 2024 22:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705272763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E+pmWiFAk9xDSX3xHw8tyfQSE8GLes3W457god8mEvU=;
	b=cxMyM7oCZSziHqrnDSE/nfEKYLW0fXqfDBpGGENQQPEuhUNCwFwSAu0y+EMs7OhvVo0fKa
	DTYGi4nUcDKVXHasP2EWXiJ7F1EhVxuqquW8tpHDTis9+86a8C9spd83ty1qlKbAL2wccr
	VSOxNdzRdSKi7vMgSkB8FemMfOiQTZq9ZLZRY1xzIpYbNCXIvYaS5ZOSUftnJJKHYQzLT/
	2RnSR+f6VaYg8GafFi3eFNA9W3pCJmXAuckix2LHpTPN2BhSiqXuVwYRbksTwqnaj/C7uT
	ZqbZ9w3kqMFTXfKLwGdsAH604MvxAB+AjF8OXlq1/oXfGT6XJUb2sGIplZUlng==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: document hotjoin sysfs entry
Date: Sun, 14 Jan 2024 23:52:25 +0100
Message-ID: <20240114225232.140860-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_145248_946480_54415AC1 
X-CRM114-Status: UNSURE (   8.32  )
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

RnJvbTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgoK
VGhlIGhvdGpvaW4gc3lmcyBlbnRyeSBhbGxvd3MgdG8gZW5hYmxlIG9yIGRpc2FibGUgSG90LUpv
aW4gb24gdGhlIEN1cnJlbnQKQ29udHJvbGxlciBvZiB0aGUgSTNDIEJ1cy4KClNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KLS0t
CiBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1pM2MgfCAxNSArKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtaTNjIGIvRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1idXMtaTNjCmluZGV4IGU1MjQ4ZmQ2N2E1Ni4uYzgxMmFiMTgwZmY0IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1pM2MKKysrIGIv
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtaTNjCkBAIC04OCw2ICs4OCwyMSBA
QCBEZXNjcmlwdGlvbjoKIAkJVGhpcyBlbnRyeSBkZXNjcmliZXMgdGhlIEhEUkNBUCBvZiB0aGUg
bWFzdGVyIGNvbnRyb2xsZXIKIAkJZHJpdmluZyB0aGUgYnVzLgogCitXaGF0OgkJL3N5cy9idXMv
aTNjL2RldmljZXMvaTNjLTxidXMtaWQ+L2hvdGpvaW4KK0tlcm5lbFZlcnNpb246ICA2LjgKK0Nv
bnRhY3Q6CWxpbnV4LWkzY0B2Z2VyLmtlcm5lbC5vcmcKK0Rlc2NyaXB0aW9uOgorCQlJM0PigJlz
IEhvdC1Kb2luIG1lY2hhbmlzbSBhbGxvd3MgYW4gSTNDIERldmljZSB0byBpbmZvcm0gdGhlCisJ
CUFjdGl2ZSBDb250cm9sbGVyIHRoYXQgYSBuZXdseS1qb2luZWQgVGFyZ2V0IGlzIHByZXNlbnQg
b24gdGhlCisJCUkzQyBCdXMgYW5kIGlzIHJlYWR5IHRvIHJlY2VpdmUgYSBEeW5hbWljIEFkZHJl
c3MsIGluIG9yZGVyIHRvCisJCWJlY29tZSBmdWxseSBmdW5jdGlvbmFsIG9uIHRoZSBCdXMuIEhv
dC1Kb2luIGlzIHVzZWQgd2hlbiB0aGUKKwkJVGFyZ2V0IGlzIG1vdW50ZWQgb24gdGhlIHNhbWUg
STNDIGJ1cyBhbmQgcmVtYWlucyBkZXBvd2VyZWQKKwkJdW50aWwgbmVlZGVkIG9yIHVudGlsIHRo
ZSBUYXJnZXQgaXMgcGh5c2ljYWxseSBpbnNlcnRlZCBpbnRvIHRoZQorCQlJM0MgYnVzCisKKwkJ
VGhpcyBlbnRyeSBhbGxvd3MgdG8gZW5hYmxlIG9yIGRpc2FibGUgSG90LWpvaW4gb2YgdGhlIEN1
cnJlbnQKKwkJQ29udHJvbGxlciBkcml2aW5nIHRoZSBidXMuCisKIFdoYXQ6CQkvc3lzL2J1cy9p
M2MvZGV2aWNlcy9pM2MtPGJ1cy1pZD4vPGJ1cy1pZD4tPGRldmljZS1waWQ+CiBLZXJuZWxWZXJz
aW9uOiAgNS4wCiBDb250YWN0OglsaW51eC1pM2NAdmdlci5rZXJuZWwub3JnCi0tIAoyLjQzLjAK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
