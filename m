Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F502FA3758
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Sep 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=stAgH+qseuJgsSMwbudSc4eHZtACKZ89CA10/VvAg8w=; b=QIo3gAhUWVYg50
	ZAAQ/klE9AgNCuLOO0gvH+8OZo8CN6t80NL7geTriAXDeBzyh0ciUidpiWRRnx7R8xWRHGtMm3s3S
	pLQ4PVcCFoc25pisSjA4zFLw67nb5El840RUB3AQ12bfQTUolEXjeXE2j5uLlJFefk4Des2nNOZ3u
	D1V2U/yyvmXmhn/4VLBwFZXt95DUTO1TFFtXukt+pTj2vsbwMutvHVycwjkSe/vC01PToZvYY3cmQ
	YBRXXQ9kCet25hCZQPBRMJBR3wKUtKtbjgnjj0Dtxh4+0rGfsd6cG8/qX2z9IMtTbg03BwkGYQGs3
	xnf5C7+YlR6lWHbIMDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZQc-00000006KlF-26cF;
	Tue, 17 Sep 2024 14:43:42 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOr2-0000000A3aa-1c5m
	for linux-i3c@lists.infradead.org;
	Wed, 11 Sep 2024 15:02:02 +0000
X-QQ-mid: bizesmtpsz11t1726066890tsr0e7
X-QQ-Originating-IP: Y6v+T0f7c12A5OabWBayGIbWcZSTO4NMcfS5l/rjM4I=
Received: from fastnlp.. ( [202.120.234.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Sep 2024 23:01:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13582565552656211047
From: Kaixin Wang <kxwang23@m.fudan.edu.cn>
To: miquel.raynal@bootlin.com
Cc: 21210240012@m.fudan.edu.cn,
	21302010073@m.fudan.edu.cn,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	Kaixin Wang <kxwang23@m.fudan.edu.cn>
Subject: [PATCH] i3c: master: svc: Fix use after free vulnerability in svc_i3c_master Driver Due to Race Condition
Date: Wed, 11 Sep 2024 23:01:35 +0800
Message-Id: <20240911150135.839946-1-kxwang23@m.fudan.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:m.fudan.edu.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_080201_128051_50E86C34 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 17 Sep 2024 07:43:41 -0700
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

SW4gdGhlIHN2Y19pM2NfbWFzdGVyX3Byb2JlIGZ1bmN0aW9uLCAmbWFzdGVyLT5oal93b3JrIGlz
IGJvdW5kIHdpdGgKc3ZjX2kzY19tYXN0ZXJfaGpfd29yaywgJm1hc3Rlci0+aWJpX3dvcmsgaXMg
Ym91bmQgd2l0aApzdmNfaTNjX21hc3Rlcl9pYmlfd29yay4gQW5kIHN2Y19pM2NfbWFzdGVyX2li
aV93b3JrIMKgY2FuIHN0YXJ0IHRoZQpoal93b3JrLCBzdmNfaTNjX21hc3Rlcl9pcnFfaGFuZGxl
ciBjYW4gc3RhcnQgdGhlIGliaV93b3JrLgoKSWYgd2UgcmVtb3ZlIHRoZSBtb2R1bGUgd2hpY2gg
d2lsbCBjYWxsIHN2Y19pM2NfbWFzdGVyX3JlbW92ZSB0bwptYWtlIGNsZWFudXAsIGl0IHdpbGwg
ZnJlZSBtYXN0ZXItPmJhc2UgdGhyb3VnaCBpM2NfbWFzdGVyX3VucmVnaXN0ZXIKd2hpbGUgdGhl
IHdvcmsgbWVudGlvbmVkIGFib3ZlIHdpbGwgYmUgdXNlZC4gVGhlIHNlcXVlbmNlIG9mIG9wZXJh
dGlvbnMKdGhhdCBtYXkgbGVhZCB0byBhIFVBRiBidWcgaXMgYXMgZm9sbG93czoKCkNQVTAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTEKCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgc3ZjX2kzY19tYXN0ZXJfaGpfd29yawpzdmNfaTNjX21h
c3Rlcl9yZW1vdmUgICAgICAgICAgICAgICB8CmkzY19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVy
LT5iYXNlKXwKZGV2aWNlX3VucmVnaXN0ZXIoJm1hc3Rlci0+ZGV2KSAgICAgfApkZXZpY2VfcmVs
ZWFzZSAgICAgICAgICAgICAgICAgICAgICB8Ci8vZnJlZSBtYXN0ZXItPmJhc2UgICAgICAgICAg
ICAgICAgIHwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBpM2NfbWFzdGVy
X2RvX2RhYSgmbWFzdGVyLT5iYXNlKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IC8vdXNlIG1hc3Rlci0+YmFzZQoKRml4IGl0IGJ5IGVuc3VyaW5nIHRoYXQgdGhlIHdvcmsg
aXMgY2FuY2VsZWQgYmVmb3JlIHByb2NlZWRpbmcgd2l0aCB0aGUKY2xlYW51cCBpbiBzdmNfaTNj
X21hc3Rlcl9yZW1vdmUuCgpTaWduZWQtb2ZmLWJ5OiBLYWl4aW4gV2FuZyA8a3h3YW5nMjNAbS5m
dWRhbi5lZHUuY24+Ci0tLQogZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2Mt
bWFzdGVyLmMKaW5kZXggMGE2OGZkMWI4MWQ0Li5lMDg0YmE2NDhiNGEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCisrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9zdmMtaTNjLW1hc3Rlci5jCkBAIC0xNzc1LDYgKzE3NzUsNyBAQCBzdGF0aWMgdm9pZCBzdmNf
aTNjX21hc3Rlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1
Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwog
CisJY2FuY2VsX3dvcmtfc3luYygmbWFzdGVyLT5oal93b3JrKTsKIAlpM2NfbWFzdGVyX3VucmVn
aXN0ZXIoJm1hc3Rlci0+YmFzZSk7CiAKIAlwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5k
KCZwZGV2LT5kZXYpOwotLSAKMi4yNS4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
