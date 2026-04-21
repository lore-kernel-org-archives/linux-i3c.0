Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94F9F5A8DA
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 03:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgwWqYQ2rbMwIT1YnL/VXhpJkRh/NnYC5156n+2pZa4=; b=D9lIwuoHFuSRIL
	MclKRlM3vKnWLtCNEjOzD9jLAaCb2F1+AV1QZgGUDUyk17ma2Er6hQcTdpkPfBqj/yXwQON9p4RjH
	nZHySL68U3dR+j6wZwG2aJA8P1/eRUnMOnZK5isS1l0TU8GSdEaf8aMkTTa0Uos2LijVDZuy1yyQK
	vksKnBQyhBQrmDTI9/gTkiML5yD4m5IoMMnaXLnzzL81jFLJThPnSNz4MCakog0fxYDplRAu4hfs8
	m3z/bLnhcBcCx8m9FqDHLzDz6CQ30DtaiOymMavu3syRippy/W7w2fnb3dfWoZQu1vSU2sVfwcB3r
	w9EuBS2a8zXxx+RUT8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF259-000000080Ua-2XbG;
	Tue, 21 Apr 2026 03:47:27 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF255-000000080UG-461Z
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 03:47:25 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-79a7109f568so42599897b3.1
        for <linux-i3c@lists.infradead.org>; Mon, 20 Apr 2026 20:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776743243; cv=none;
        d=google.com; s=arc-20240605;
        b=kKbNqCKEfjaL5vWzRRuXH8H0xpSTJ4b3YscmDD49qajHk7EtoqNUlOSOWTVdJ4TN0/
         ls00X0kjB4V3BG1YiY4y8ZsB5SvEbeoPmg5b40J3rbR6povOqFYXinAi2FOTPJenkCP6
         GqdUPtbbySDxFshxyt325PLHFIz5MAmE+KJHaC2zOPR5q+kIRZm+rYib5bQ6tO9zYeuT
         rzlso51SU0EBhcIP9OHTbgY85+TAMkvVu/0RsNA9jEDHa0gHrylavlvY1YUgpYGgww1M
         fx0w5kKfTwY7BBj/5uvTqImQXzsmogr7dqmpPUT+vbTg0ZRKdCAOZli4RkeYmsNskpSz
         QyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6nmrtV92UBgxkV7Tw0IGhMV3qeFTraY/ryIAiM1Pm+4=;
        fh=gAJz+rtIwhsNnMtVkz+M56cr+LcY5rs2gNzoW+OySnU=;
        b=SO0MrHJD0sZ+LVGPsQBxe5BGg6YhqosBaUNTY7HOnF5bQQm7Fc4zJyyRltCm0J14S7
         q14nh5LKgPh9xPKCY+WrxnDvuDVknVA4KpTsC576Ae33fywb6Fkdecbcwx9Wb9fbbdyd
         S/ODApO45AptLYr9cVRp7JuQ6k6LKlSUbJntH14gavHAAya99Pui7JIS5BJ9l9aOs4NR
         2lgtDkAP/S7cX8yFIjRPLOp2w6oRX3eBuXVVg72EqT4qCwaoKcgGNhQUt2pma/dRMiZ5
         RmV7Ea/4eU0Q/pV2YW5Vvhk6UG0ER4wiuMn96xYPXLhC05M8N9OH2laU9pXVxWdiVNIS
         jfvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776743243; x=1777348043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nmrtV92UBgxkV7Tw0IGhMV3qeFTraY/ryIAiM1Pm+4=;
        b=EeM+RUsQiHtD8hc6o+GrQeaUpldBAOIf2qed3erF9hB3SD8mFgsadJzvg5xAgVrtyj
         2mDSsyR9rY0ur4pV/j7ibdZda3nLjuqQak9LSRqaGjI5nw9SelLBbZa+Z6uZUhzycvcP
         bHmJDtSnMWMZC4zk0yBMucCot6HWlOHNzdllNURbDhlOOt3f/csE9tjw1iRrQHckKV72
         2VE3h+othD4k0bvnh6NDbYDx+JEJP7oE6ktmykphb2IcYWupcuMJqKeEivEuV/zFPbNL
         9x3sfUv/nSdnWz8HZsLOpke0+cUEWkOk+U9koisDDhMbhBQ3XRHsydPlGXQ/iywrzbIj
         51Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776743243; x=1777348043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6nmrtV92UBgxkV7Tw0IGhMV3qeFTraY/ryIAiM1Pm+4=;
        b=ar8/C4KIxSRz98yeDaXNxdzmzMDqMP7tVUQl7aHPFkMEhvT32pPtn1nKBKd5Enf/UH
         m0fRQxuYeq2nTSBq3axwuYSBrusNXnOzAhAj9lJYZ7bbKL10qg/LJd2SNrRDXsHvNZRp
         Uu+nLrqONTft7S/1YLg4oAf+iDIukr1u1ej060rTgOoEQjKns7dr8ws0fJXbdZkBEr5/
         bVKcVEfxKMQG6tPODRK+zIvcbfyTjgCWOFe6CnGtD9vig0L5I239tLZgkkzEQu6Pq5vR
         he+g1be11irpwCjedB+DT8Jg3ceGMdkWXJ9h2bxTENBe52eslp6yPedg31jtafCOKfSC
         uRaw==
X-Forwarded-Encrypted: i=1; AFNElJ/RpI5hI8et3FA1SV0rajcEhojTt9IGEbBFw9aZ8l7dkHsfRtAskIdUxeai95csXsh1eLsM2hVjRCo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwF8Mm5Lh4VF3n8BFrHd6ZACmFlXPbhTNi+GnkfjrNWCxzEkrm8
	pYDWfTKGeiQs2erS4jMCa2yBLat3+rSS2bxUoZeuSvdgBVTAl5AcR/B+WWljV1C4J5MbVwTPeI8
	FO9eFG7xSDw1oazU7Llu1Wz2MhEMN5UI=
X-Gm-Gg: AeBDietaYhf/GJH1wnSrjIbLE222x1vIc6TqrCcC/bkTLPYZoCu5+ZRDvpVIlc5WrGf
	pqLNwcVitnr6bQ570lLUzu2tMw6FBf+m5EY7CkiINzihvI7TxdpOdxFPDufLndbJRHNnLjZhv3P
	TMUu3T7KWAmMPDOFl7U4hz861dJtavz2nafw1Yd8Y4KrZq34dh4J7LDyA7OONBDDJc7fNJUyH6Q
	E9lFVGgjuXeXeNbb72lVWiYQDSEJtKPYKTMDVEOFcdrY5CbKmDN+UdmoAKvQoC/8TASmeuQZcot
	5CqOGDwwSu4J4Ew=
X-Received: by 2002:a05:690c:6d83:b0:7b5:a17a:6f55 with SMTP id
 00721157ae682-7b9ecf322a6mr169694707b3.21.1776743242723; Mon, 20 Apr 2026
 20:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260421011049.63899-1-m32285159@gmail.com> <aeblkBbdKYSuUysd@lizhi-Precision-Tower-5810>
In-Reply-To: <aeblkBbdKYSuUysd@lizhi-Precision-Tower-5810>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 20 Apr 2026 22:47:11 -0500
X-Gm-Features: AQROBzBcXUXgk70upXEe1J-FujxrhzzCEkpQ3v8otQx8Auv4t7B59yIYo6pWEKs
Message-ID: <CAKqfh0FY=DOgybnVKMK+TyGAfh9Lkdi0nSMWQWfRRJMr+SKXyA@mail.gmail.com>
Subject: Re: [PATCH] i3c: master: replace sprintf() with sysfs_emit() and sysfs_emit_at()
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_204724_026047_C77B8ED2 
X-CRM114-Status: UNSURE (   8.39  )
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

T24gTW9uLCBBcHIgMjAsIDIwMjYgYXQgOTo0OOKAr1BNIEZyYW5rIExpIDxGcmFuay5saUBueHAu
Y29tPiB3cm90ZToKPgo+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMu
cnN0IGRvbid0IHByZWZlciB1c2Ugd29yZHMgInRoaXMKPiBwYXRjaCIsICBVc2UgaW1wZXJhdGl2
ZSBtb29kCj4KPiBSZXBsYWNlcyBzcHJpbnRmKCkgd2l0aCBzeXNmc19lbWl0W19hdF0oKS4gQWRk
IG1pc3NpbmcgbmV3bGluZXMgYXQgdGhlIGVuZAo+IG9mIHNvbWUgc3lzZnNfZW1pdCgpIChmb3Jt
ZXJseSBzcHJpbnRmKCkpIGNhbGxzLgo+CgpIaSBGcmFuaywKClRoYW5rcyBmb3IgcG9pbnRpbmcg
bWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiwgSSdsbCBtYWtlIHN1cmUgdG8gYWRkCnRoZXNlIGNo
YW5nZXMgZm9yIGEgdjIgd2hlbiBJJ3ZlIGdvdCB0aGUgdGltZS4KCmJlc3QgcmVnYXJkcywKbWF4
d2VsbAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
