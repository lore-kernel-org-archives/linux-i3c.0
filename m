Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F63C5AD55
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Aug 2026 01:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pcqgaaN1VV87OWj0XppCGl9KYSoUi9/ZEuZVk91dnWM=; b=RaHtpqGQEsUQp0
	HqIcRB3+zvtXejwuqb8sS8Jm3fulftSElsTXBXF+eCdgtkXZ+9zuZfWH2VgnYtX4P33+N5JJ0P72X
	WW03uxZyDUsJhYz40BMAFO3Isc+5/VrkMV1ZU496zvQgP+im+SbOZY8NUtHMC4CMM/zLp8RNCHItw
	1F+QQAWZ7YylH3huHhQX2J7SwQT6A1hTlZj5ekuchXpjcw6ujMNy0T0gJJpfma653PrQXRpcc5Pxi
	7GzHlIg5JBf9w33VlJBs1D39KpbiDzS7bHodFELwyE42JJtF/53pydWl0p3KNdFS8vRg2eTytp14F
	x14vPhE8j1ZLtPOPqasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtEr9-0000000AsxV-0h3c;
	Mon, 10 Aug 2026 01:31:11 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtEr6-0000000Asx6-1IUX
	for linux-i3c@lists.infradead.org;
	Mon, 10 Aug 2026 01:31:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1729194a91.1
        for <linux-i3c@lists.infradead.org>; Sun, 09 Aug 2026 18:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786325467; x=1786930267; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZgz3ItH2Xd3Ug8izPKPXju25py60rR+KSsgX4sTFoY=;
        b=oqBRlqXs3Z5qAl1aTh9HyS0BxBClbMeLdlSbg7E/IQzmKKlSAmfHJ74glc7XHuIIWu
         Qo6J4Ag/kEjzhtbCLNUXIF3tMxyXktgkiRz4Lqe2o5F+6Y4ERc7+FFnXPdxoM84gb4Xk
         5PmgX7oIlSYitZmrO5LYnm0YnbLzRpfX7sb+fVWfGb7nAuOOQ9g2shLhWmoucwgF/4Mu
         +j8kVovMlM/OtCfFwCsod2l+roVLoaFnj4i/v+YsEF9b6SQyKfiwrpKpWjCIficZyiVJ
         1+ibfVDDRqMNSZXD2vl5mpY/5wQCZ45R/BYsk0SJMorLOvI0j8RS/HsoaUG+RNBoI6r7
         BUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786325467; x=1786930267;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZgz3ItH2Xd3Ug8izPKPXju25py60rR+KSsgX4sTFoY=;
        b=cgHNCa5QMdasNC3RUeNbLQDj5PUXyi50EpbPkFyK/ayGQkv4/BItMQ5Nw47MykcTh6
         1WmAElgF0Z+2UuNWFg3YPfhsJQXk3shvfsILFIJ6isS1NVvX+/b8iepxHCInAbN34aWo
         0aQyypN7K4BnCaffsnwOtHSOQFNH2P7fLYaKav0QCWaWcBo3c48tXO6BxzYeMI9/pYe1
         3HeD0lYFZbbQ/IY61QG3W9659Di5NIongUCwAERme6CJowJPSu66M5NLFhSWBiduQ0GR
         JxNh6ZsyzU7G10hsH0CZLi7q/yS9CywH66JsAWxJ9EQvW1vM9Jiu9F9KH+j2uYSpxrLZ
         N9FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdanMaH1jtvrNKAhjq2ar34VYox8dlZvEZ8oOrOVt9qfrXeFIqmQRlu2GAE8wiCaFcsyQ5E83dmMc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/S9vkACn+OYZ+FPzJnQKNZPf+rnxIcbJzlDJ1Gj72zGGJW12j
	UCQfPF8XullnxB71I+MA5uWC9Sp1Z9KjwzOlep7XiWlJphaZvKmHYXN7OvgEuHiZ
X-Gm-Gg: AR+sD10VYVMGcW1EPIi3RTl+oX0sWlgQn4iher52H3SsjQbW34nSTFnmdgRfFkPA3jf
	rq0HRsopgS5CX8tyhYx0E2CiBJCwt9mNAvnIqs6xjOHBaCVBsBWr8/Yi2wrcpjE6zSZcuCsJt44
	/OumYXR/CnhMY7AxHBvWoPKphPA1EoV2avNOuuanz39wCqBlTOReVY3FfTHW8x3C4GfcK/7daj8
	232P8Kx7w/vmvHFgKzjM6M5uFqzvAV3ontnEdnc//yhU5wGcCVuB404LTOs/dsdekI3m5PjN571
	PWgAAJ4yqzW29aT/lzR57g3AETnko+HiIoSU8YnSPV/JDK1bKxGXJ6EqT76Ehl0zSn6AiOVhpb0
	FRs8nHlat9UK8HaRP9vb7juqpLE1lHCDs18f9gp6KzVXBZs3Ya6v1vjqwfdV5aFGVuYVeOPW7L1
	RlG9Eheir+U4hqxQH3PSMzZFeNrRhGEjVmv/fm0ozZwBnZJijcgPSHGXWvxRptEAZBwjE=
X-Received: by 2002:a17:90b:4c03:b0:38e:655c:6516 with SMTP id 98e67ed59e1d1-39261d10765mr15210520a91.0.1786325466885;
        Sun, 09 Aug 2026 18:31:06 -0700 (PDT)
Received: from cs20-buildserver.. ([2402:7500:502:897d:707a:c9da:8c8a:cc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b15ab898sm4941419a91.1.2026.08.09.18.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 18:31:06 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1] i3c: master: allocate IBI workqueue with WQ_HIGHPRI
Date: Mon, 10 Aug 2026 09:30:59 +0800
Message-Id: <20260810013059.3055787-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_183108_378712_94894CD6 
X-CRM114-Status: GOOD (  10.74  )
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

RnJvbTogU3RhbmxleSBDaHUgPHlzY2h1QG51dm90b24uY29tPgoKVGhlIElCSSAoSW4tQmFuZCBJ
bnRlcnJ1cHQpIHdvcmtxdWV1ZSBpcyBhbGxvY2F0ZWQgd2l0aCBvbmx5CldRX01FTV9SRUNMQUlN
LCB3aGljaCBwbGFjZXMgSUJJIHBheWxvYWQgcHJvY2Vzc2luZyBhdCBub3JtYWwKd29ya2VyIHBy
aW9yaXR5LiBUaGlzIGlzIGluYWRlcXVhdGUgZ2l2ZW4gdGhlIHRpbWUtc2Vuc2l0aXZlCm5hdHVy
ZSBvZiBJQkkgaGFuZGxpbmcuCgpJbiB0aGUgSTNDIHByb3RvY29sLCB3aGVuIGEgdGFyZ2V0IGFz
c2VydHMgYW4gSUJJLCB0aGUgU0RBIGxpbmUKaXMgaGVsZCBsb3cgdW50aWwgdGhlIG1hc3RlciBh
Y2tub3dsZWRnZXMgYW5kIGNvbXBsZXRlcyB0aGUKZXhjaGFuZ2UuIFRoZSBJUlEgaGFuZGxlciAo
dG9wIGhhbGYpIEFDS3MgdGhlIElCSSwgcmVhZHMgdGhlCnBheWxvYWQsIGVtaXRzIGEgU1RPUCwg
YW5kIGltbWVkaWF0ZWx5IHF1ZXVlcyB0aGUgcGF5bG9hZApwcm9jZXNzaW5nIHRvIHRoZSBwZXIt
ZGV2aWNlIG9yZGVyZWQgd29ya3F1ZXVlIHZpYQppM2NfbWFzdGVyX3F1ZXVlX2liaSgpIOKAlCBl
ZmZlY3RpdmVseSB0aGUgYm90dG9tIGhhbGYgb2YgdGhlCklCSSBpbnRlcnJ1cHQgcGF0aC4KCklm
IHRoaXMgd29ya3F1ZXVlIHdvcmtlciBpcyBkZWxheWVkIGJ5IGNvbXBldGluZyBub3JtYWwtcHJp
b3JpdHkKdGFza3MsIHRoZSBJQkkgbm90aWZpY2F0aW9uIHJlYWNoZXMgdGhlIGNsaWVudCBkcml2
ZXIgbGF0ZS4gRm9yCmxhdGVuY3ktc2Vuc2l0aXZlIGNsaWVudHMgKGUuZy4gc2Vuc29ycyByZXBv
cnRpbmcgYWxlcnRzLApob3RwbHVnIGV2ZW50cyksIHRoaXMgZGVmZWF0cyB0aGUgcHVycG9zZSBv
ZiB1c2luZyBJQkkgb3Zlcgpwb2xsaW5nLiBGdXJ0aGVybW9yZSwgYmVjYXVzZSB0aGUgb3JkZXJl
ZCB3b3JrcXVldWUgc2VyaWFsaXNlcwpzbG90cywgYSBiYWNrbG9nIG9mIGRlbGF5ZWQgc2xvdHMg
Y2FuIGV4aGF1c3QgdGhlIHByZS1hbGxvY2F0ZWQKSUJJIHNsb3QgcG9vbCwgY2F1c2luZyBzdWJz
ZXF1ZW50IElCSXMgdG8gYmUgZHJvcHBlZCBhdCB0aGUKaGFyZHdhcmUgbGV2ZWwuCgpBZGQgV1Ff
SElHSFBSSSB0byBlbnN1cmUgSUJJIGJvdHRvbS1oYWxmIHdvcmsgaXMgc2NoZWR1bGVkCnByb21w
dGx5IGFmdGVyIHRoZSB0b3AtaGFsZiBJUlEgaGFuZGxlciBlbnF1ZXVlcyBpdCwga2VlcGluZwp0
aGUgSUJJIHByb2Nlc3NpbmcgcGlwZWxpbmUgY29uc2lzdGVudCB3aXRoIHRoZSBpbnRlcnJ1cHQt
bGlrZQpzZW1hbnRpY3MgdGhlIHByb3RvY29sIGRlbWFuZHMuCgpTaWduZWQtb2ZmLWJ5OiBTdGFu
bGV5IENodSA8eXNjaHVAbnV2b3Rvbi5jb20+Ci0tLQogZHJpdmVycy9pM2MvbWFzdGVyLmMgfCAz
ICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKaW5k
ZXggZjFiZTM4YTY0MGNhLi44ZmRkNjdhMDMxZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci5jCisrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCkBAIC0zNTA1LDcgKzM1MDUsOCBAQCBp
bnQgaTNjX2Rldl9yZXF1ZXN0X2liaV9sb2NrZWQoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAog
CWlmICghaWJpKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCWliaS0+d3EgPSBhbGxvY19vcmRlcmVk
X3dvcmtxdWV1ZShkZXZfbmFtZShpM2NkZXZfdG9fZGV2KGRldi0+ZGV2KSksIFdRX01FTV9SRUNM
QUlNKTsKKwlpYmktPndxID0gYWxsb2Nfb3JkZXJlZF93b3JrcXVldWUoZGV2X25hbWUoaTNjZGV2
X3RvX2RldihkZXYtPmRldikpLAorCQkJCQkgIFdRX01FTV9SRUNMQUlNIHwgV1FfSElHSFBSSSk7
CiAJaWYgKCFpYmktPndxKSB7CiAJCWtmcmVlKGliaSk7CiAJCXJldHVybiAtRU5PTUVNOwotLSAK
Mi4zNC4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1pM2MK
